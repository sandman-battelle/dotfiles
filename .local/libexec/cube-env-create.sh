#!/usr/bin/env bash

# shellcheck disable=SC1083
# @getoptions
parser_definition() {
	setup   REST help:usage -- "Usage: cube env create [options] -n <name>" ''
	param	NAME		-n --name							-- "CUBE Environment Name"
	msg -- 'Options:'
	disp	:usage		-h --help
	disp	VERSION		-v --version
	param	PLATFORM	-p --platform init:"platform"		-- "CUBE Platform Resource Group Name"
	param	CIDR		-c --cidr init:"cidr"							-- "CUBE Network CIDR"
	param	WORKLOAD	-w --workload init:"workload"						-- "CUBE Workload Name"
	param	SUB			-s --sub init:"subscription"							-- "Azure subscription for workload"
	param	ACCOUNT		-a --account init:="cubetfstateprod" -- "CUBE State Storage Account Name"
}

source /home/sandman/.local/libexec/functions.sh

cube-env-gh-secret-create()
{
	local secret_name=$1
	local secret_value=$2

	gh secret set "${secret_name}" --env "${name}" -b "${secret_value}" || die
}

cube-env-gh-environment-create()
{
	local azure_tenant_id=$(cube-env-current-tenant-id)
	local azure_subscription_id=$(cube-env-workload-subscription-id)
	local azure_client_secret=$(az ad app credential reset \
			--id $(az ad app list --all --query "[?displayName=='$(cube-env-deployment-id)'].appId" -o tsv) \
			--display-name $(cube-env-deployment-id) --only-show-errors --query "password" -o tsv)
	local azure_client_id=$(cube-env-app-clientid)

	local status_code=$(curl -s -w '%{http_code}' \
		-X PUT \
		-H "Accept: application/vnd.github.v3+json" \
		-H "Authorization: token $(gh auth token)" \
		-H "Content-Type: application/json" \
		https://api.github.com/repos/battellecube/$workload/environments/$name)

    #TODO: Need to test the env was actually created
	logger --priority local7.info "github create environment http_code: ${status_code}"

	cube-env-gh-secret-create AZURE_TENANT_ID "${azure_tenant_id}" || die
	cube-env-gh-secret-create AZURE_SUBSCRIPTION_ID "${azure_subscription_id}" || die
	cube-env-gh-secret-create AZURE_CLIENT_SECRET "${azure_client_secret}" || die
	cube-env-gh-secret-create AZURE_CLIENT_ID "${azure_client_id}" || die

}

platform() {
	[ -z $PLATFORM+is_set ] || PLATFORM=cube-platform-$(latest-release 'cube-platform')
}

workload() {
	[ -z $WORKLOAD+is_set ] || WORKLOAD=$(basename $(git rev-parse --show-toplevel))
}

subscription() {
	[ -z $SUB+is_set ] || SUB=$(cube-env-current-subscription-id)
}

cidr() {
	cube-env-download $ACCOUNT
	[ -z $CIDR+is_set ] || CIDR=$(for cidr in 10.237.{1..255}.0/24; do [[ $(recsel -t environment -e "cidr = '$cidr'" -p cidr environments.rec | tee | wc -l) == 0 ]] && echo $cidr ; done | head -n1)
}

eval "$(/home/sandman/.local/bin/getoptions parser_definition - "$0") die"
cat <<HERE

Creating a new environment with these values
--------------------------------------------
WORKLOAD:     $WORKLOAD
NETWORK:      $CIDR
PLATFORM:     $PLATFORM
STATESTORE:   $ACCOUNT
SUBSCRIPTION: $(az account show -s $SUB --query '[name,id]' -o tsv | tr '\n' ' ')
--------------------------------------------
Is this correct? (y/N)
HERE
read key
[[ $key == "y" ]] || die


/home/sandman/.local/libexec/wonder-twins-power-activate.ps1

echo "...creating environment record"
cube-env-make-record $NAME $WORKLOAD $CIDR $PLATFORM $ACCOUNT $SUB || die "cube-env-create -> cube-env-make-record failed"
cube-env-set-local $NAME $WORKLOAD || die "cube-env-create -> cube-env-set-local failed"

echo "...setting up azure service principal"
cube-env-create-sp || die

echo "...succfully created and configured ${WORKLOAD}-${NAME} service principal"

#echo "...creating git environment branch"
#cube-env-gh-branch-create || die

echo "...creating git environment and secrets"
cube-env-gh-environment-create || die

echo "...running create hook"
cube-env-create-hook || die

cube-env-set-local-sp

echo "...successfully created ${WORKLOAD}-${NAME} environment"
