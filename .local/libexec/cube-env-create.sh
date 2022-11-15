#!/usr/bin/env bash

# shellcheck disable=SC1083
# @getoptions
parser_definition() {
	setup   REST help:usage -- "Usage: cube env create [options]" ''
	msg -- 'Options:'
	disp	:usage		--help -h
	disp	VERSION		--version -v
	param	NAME		--name -n	-- "CUBE Environment Name"
	param	PLATFORM	--platform -p	-- "CUBE Platform Resource Group Name"
	param	CIDR		--cidr -c	-- "CUBE Network CIDR"
	param	WORKLOAD --workload -w -- "CUBE Workload Name"
	param	SUB	--sub -s -- "Azure subscription for workload"
	param	ACCOUNT		--account -a init:="cubetfstateprod" -- "CUBE State Storage Account Name"
}

eval "$(/home/sandman/.local/bin/getoptions parser_definition - "$0") die"

source /home/sandman/.local/libexec/functions.sh

echo "...creating environment record"
cube-env-make-record $NAME $WORKLOAD $CIDR $PLATFORM $ACCOUNT $SUB || die
cube-env-set-local $NAME $WORKLOAD || die

echo "...setting up azure service principal"
cube-env-create-sp || die

echo "...succfully created and configured ${WORKLOAD}-${NAME} service principal"

echo "...creating git environment branch"
cube-env-gh-branch-create || die

echo "...creating git environment and secrets"
cube-env-gh-environment-create || die

echo "...successfully created ${WORKLOAD}-${NAME} environment"


#################

# PRODUCTION_TENANT_ID=215220de-12d7-408e-b764-7e998342ac42
# DEVELOPMENT_TENANT_ID=b43c57c6-26f2-4956-8264-73fbc900fe90

# az account set --subscription 80920ed2-0a36-4cb1-9907-329ea674e58d
# # check logged in
# az account list  --refresh  --query "[?id == '80920ed2-0a36-4cb1-9907-329ea674e58d' && state == 'Enabled'] | [0].name"  -o tsv
# # get the cit_security subscription id in the battelle.us tenant
# az account list  --refresh  --query "[?name == 'cit_security' && tenantId == '215220de-12d7-408e-b764-7e998342ac42' && state == 'Enabled'] | [0].id"  -o tsv
# az ad sp create-for-rbac  --role "Reader"  --scopes "/subscriptions/cab6c334-ae95-4a8d-8041-1127009a14bb"  --name secops-not-main
# az ad sp create-for-rbac  --role "Log Analytics Contributor"  --scopes "/subscriptions/cab6c334-ae95-4a8d-8041-1127009a14bb"  --name secops-not-main
# az account list  --refresh  --query "[?name == 'cube-platform' && tenantId == '215220de-12d7-408e-b764-7e998342ac42' && state == 'Enabled'] | [0].id"  -o tsv
# az ad sp create-for-rbac  --role "Owner"  --scopes "/subscriptions/80920ed2-0a36-4cb1-9907-329ea674e58d" "/subscriptions/f3f3926c-bfc9-4986-b7d2-7bd45fae777a"  --name secops-not-main
# az rest  --url https://graph.microsoft.us/v1.0/roleManagement/directory/roleDefinitions  --query "value[?displayName == 'Global Administrator'] | [0].id"  -o tsv
# az ad sp list --all  --query "[?displayName == 'seceng-secops-not-main'] | [0].objectId"  -o tsv
# az ad app permission add  --id 49b5fe03-c7ba-41d2-bb6d-c99e2e499110  --api 00000003-0000-0000-c000-000000000000  --api-permissions 19dbc75e-c2e2-444c-a770-ec69d8559fc7=Role
# az ad sp show  --id 49b5fe03-c7ba-41d2-bb6d-c99e2e499110  --query "id"  -o tsv
# az ad sp show  --id 00000003-0000-0000-c000-000000000000  --query "id"  -o tsv
# az ad sp show  --id 00000003-0000-0000-c000-000000000000  --query "appRoles[?value=='Directory.ReadWrite.All'].id"  -o tsv
# az rest  --method post  --uri https://graph.microsoft.us/v1.0/servicePrincipals/1f83d112-99d0-48b5-98de-28892ebc3591/appRoleAssignments  --body '{"principalId":"1f83d112-99d0-48b5-98de-28892ebc3591","resourceId":"82c4449a-6229-4099-9d51-856ea18e1220","appRoleId":"19dbc75e-c2e2-444c-a770-ec69d8559fc7"}'

# git branch not-main origin/main
# curl -s -w '\n%{http_code}' -X GET -H "Accept: application/vnd.github.v3+json" 
		# -H "Authorization: token $CUBE_PERSONAL_ACCESS_TOKEN"
		# -H "Content-Type: application/json"
		# https://api.github.com/repos/battellecube/secops/git/refs/heads/main

# curl -s -w '\n%{http_code}' -X POST -H "Accept: application/vnd.github.v3+json" 
	# -H "Authorization: token $CUBE_PERSONAL_ACCESS_TOKEN" 
	# -H "Content-Type: application/json" 
	# --data '{"ref":"refs/heads/not-main","sha":"a307775691ee1c2ab74ca3920391d451dcaa2419"}' 
	# https://api.github.com/repos/battellecube/secops/git/refs

# git fetch && git checkout -b not-main
# az rest  --subscription 80920ed2-0a36-4cb1-9907-329ea674e58d  --url https://graph.microsoft.us/v1.0/domains  --query "value[0].id"  -o tsv
# az account list  --refresh  --query "[?name == 'cube-platform' && tenantId == '215220de-12d7-408e-b764-7e998342ac42' && state == 'Enabled'] | [0].id"  -o tsv

# curl -s -w '\n%{http_code}' 
	# -X PUT 
	# -H "Accept: application/vnd.github.v3+json" 
	# -H "Authorization: token $CUBE_PERSONAL_ACCESS_TOKEN" 
	# -H "Content-Type: application/json" 
	# https://api.github.com/repos/battellecube/secops/environments/not-main

# curl -s -w '\n%{http_code}' 
	# -X GET -H "Accept: application/vnd.github.v3+json" 
	# -H "Authorization: token $CUBE_PERSONAL_ACCESS_TOKEN" 
	# -H "Content-Type: application/json" 
	# https://api.github.com/repos/battellecube/secops/environments/not-main/secrets/public-key

# curl -s -w '\n%{http_code}' 
	# -X PUT 
	# -H "Accept: application/vnd.github.v3+json" 
	# -H "Authorization: token $CUBE_PERSONAL_ACCESS_TOKEN" 
	# -H "Content-Type: application/json" 
	# --data '{"key_id":"568250167242549743","encrypted_value":"VfEyLUfOSBpzfRyqjNsBWof1Ei6Wy94Gn4aa72QuIjM2rvNWOPp7QmThG4B1Tcl71Vs6gAO7GiCJ5l+KsYrMolg98dq2JXeJAXSI18mPlE5p5yyO"}' 
	# https://api.github.com/repos/battellecube/secops/environments/not-main/secrets/AZURE_CLIENT_ID

# curl -s -w '\n%{http_code}' 
	# -X PUT 
	# -H "Accept: application/vnd.github.v3+json" 
	# -H "Authorization: token $CUBE_PERSONAL_ACCESS_TOKEN" 
	# -H "Content-Type: application/json" 
	# --data '{"key_id":"568250167242549743","encrypted_value":"3816BuQsFoMwNPQ6auaUR+3tmXNPDI2s7Vtz/v39UFca94brgEt2B+0ORXcCGBkt8DqZ/Xbcr0QZBtRmPvUq1vtD3toB3hVgKPFcezYlVMi1vg=="}' 
	# https://api.github.com/repos/battellecube/secops/environments/not-main/secrets/AZURE_CLIENT_SECRET

# curl -s -w '\n%{http_code}' -X PUT -H "Accept: application/vnd.github.v3+json" -H "Authorization: token $CUBE_PERSONAL_ACCESS_TOKEN" -H "Content-Type: application/json" --data '{"key_id":"568250167242549743","encrypted_value":"HfDNKcKJetAJFUbdZRKDbR7FUEmn3VXjZkRbIA/kGBO8RTgDUikpGmof5uow/raKiLVFg24cScVse07aSQZpdYm1jpHRwSYMSNKpbWJrf1NGxtso"}' https://api.github.com/repos/battellecube/secops/environments/not-main/secrets/AZURE_SUBSCRIPTION_ID
# curl -s -w '\n%{http_code}' -X PUT -H "Accept: application/vnd.github.v3+json" -H "Authorization: token $CUBE_PERSONAL_ACCESS_TOKEN" -H "Content-Type: application/json" --data '{"key_id":"568250167242549743","encrypted_value":"H+cH9Mb+s5e2u372ycDgEQQ6G1XpnfX802aehfedKkljKzvRHBebJp0wcrHk2dpuXbtg7DdFKxMOapPpXNHReNrJLkSXXipcQi/jN0vZOnIAireU"}' https://api.github.com/repos/battellecube/secops/environments/not-main/secrets/AZURE_TENANT_ID
# curl -s -w '\n%{http_code}' -X GET -H "Accept: application/vnd.github.v3+json" -H "Authorization: token $CUBE_PERSONAL_ACCESS_TOKEN" -H "Content-Type: application/json" https://api.github.com/repos/battellecube/secops
# curl -s -w '\n%{http_code}' -X PUT -H "Accept: application/vnd.github.v3+json" -H "Authorization: token $CUBE_PERSONAL_ACCESS_TOKEN" -H "Content-Type: application/json" https://api.github.com/orgs/battellecube/actions/secrets/SVCCUBECI_SSH_KEY/repositories/533912373
