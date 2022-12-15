#!/usr/bin/env bash

# shellcheck disable=SC1083
# @getoptions
parser_definition() {
	setup   REST help:usage -- "Usage: cube workload create -n <NAME> [options...] | -h"
	param	NAME	-n --name	i							-- "CUBE WORKLOAD Name"
	disp	:usage	-h --help
	msg -- '' 'Options:'
	param	ACCOUNT	-a --account init:="cubetfstateprod"	-- "CUBE State Storage Account Name (cubetfstateprod)"
	param	CORE	-c --core init:='default'				-- 'Use a named template for core module (default)'
}

eval "$(/home/sandman/.local/bin/getoptions parser_definition - "$0") die"
source /home/sandman/.local/libexec/functions.sh

# Add workload to recfile
echo -n "Addding workload to configuration data store..."
cube-env-download $ACCOUNT
recins -t workload -f name -v $NAME environments.rec || die "Could not add workload to recfile"
cube-env-upload $ACCOUNT
echo "done"

# setup local repo
echo -n "Creating workload artifacts..."
repo_dir=$(mktemp -dq)
cd $repo_dir
git init -q
git submodule add --quiet git@github.com:battellecube/terraform-cube-core modules/terraform-cube-core|| die 'Could not add core module'
git submodule add --quiet git@github.com:battellecube/terraform-cube-vdi modules/terraform-cube-vdi|| die 'Could not add VDI module'
CORE_PATH="modules/terraform-cube-core/$CORE.template"
[ -f $CORE_PATH ] && ln -s $CORE_PATH $CORE.tf
cd modules/terraform-cube-core

CUBE_CORE_VERSION=$(latest-release 'terraform-cube-core') || die "could not get latest core release tag"
git checkout --quiet $CUBE_CORE_VERSION || die "could not set core module to version $CUBE_CORE_VERSION"
cd - >/dev/null
cat<<-HERE>README.md
	# $NAME

	This README should be captured in a template file under version control
	and added to the build as dist_templates_DATA or something cool like that
	HERE
cat <<-HERE>.cuberc
	#!/usr/bin/env bash

	# One of: WORKLOAD, MODULE
	CUBE_REPO_TYPE=WORKLOAD

	cube-env-create-hook()
	{
		echo "cube-env-create-hook"
	}

	cube-env-delete-hook()
	{
		echo "cube-env-delete-hook"
	}
	HERE
mkdir -p .github/workflows
cat <<-'HERE'>.github/workflows/deploy-environment.yml
	on: [push]
	jobs:
	  deploy-workload-environment:
	    runs-on: ubuntu-latest
	    env:
	      GH_TOKEN: ${{ github.token }}
	    steps:
	      - uses: actions/checkout@v3
	        with:
	          repository: battellecube/cube-env
	          ssh-key: ${{ secrets.SVCCUBECI_SSH_KEY }}
	          path: cube-env
	          ref: deb_repo
	      - run: sudo add-apt-repository -y ppa:rmescandon/yq
	      - run: |
	         wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
	         gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint
	         echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
	         sudo apt update
	         sudo apt install terraform
	      - run: |
	         pwd
	         cd cube-env
	         ls
	         gpg --dearmor KEY.gpg
	         sudo mv KEY.gpg.gpg /usr/share/keyrings/cube-env-archive-keyring.gpg
	         sudo cp /usr/share/keyrings/cube-env-archive-keyring.gpg /etc/apt/trusted.gpg.d/
	         sudo cp cube-env.list /etc/apt/sources.list.d/
	         sudo apt update
	         sudo apt install cube-env
	      - uses: actions/checkout@v3
	      - run: cube env init
	HERE
git ignore environments.rec '.*environment*' >/dev/null
git add .
git commit -qm'initial commit'
echo "done"

# create remote repo
echo -n 'Publishing artifacts...'
gh repo create battellecube/$NAME --private --team cube-owners --source . >/dev/null
/home/sandman/.local/libexec/cube-env-create.sh -n main
git push --quiet -u origin main

# add topics
gh repo edit battellecube/$NAME --add-topic cube --add-topic workload >/dev/null

# set branch protections
protection_response=$(curl -s -X PUT -H 'Accept: application/vnd.github+json' -H "Authorization: Bearer $(gh auth token)" https://api.github.com/repos/battellecube/$NAME/branches/main/protection -d '{"required_status_checks":{"strict":true,"contexts":[]},"enforce_admins":true,"required_pull_request_reviews":{"dismissal_restrictions":{"users":[],"teams":[]},"dismiss_stale_reviews":true,"require_code_owner_reviews":true,"required_approving_review_count":1,"require_last_push_approval":true,"bypass_pull_request_allowances":{"users":[],"teams":[]}},"restrictions":{"users":[],"teams":[],"apps":[]},"required_linear_history":true,"allow_force_pushes":false,"allow_deletions":true,"block_creations":true,"required_conversation_resolution":true,"lock_branch":false,"allow_fork_syncing":true}' || die "We aren't protected!")
echo "done"
cat <<HERE

$NAME has be created and is ready for deployment.  You can create a new
deployment environment with something like

cube env create \\
  --platform $(latest-release 'cube-platform') \\
  --workload $NAME \\
  --cidr <CIDR> \\
  --subscription <SUBSCRIPTION_NAME> \\
  --name <ENV_NAME>
HERE
