#!/usr/bin/env bash

# shellcheck disable=SC1083
# @getoptions
parser_definition() {
	setup   REST help:usage -- "Usage: cube workload delete <NAME>" ''
	msg -- 'Options:'
	disp	:usage		-h --help
	param	ACCOUNT		--account -a init:="cubetfstateprod" -- "CUBE State Storage Account Name"
	param	WORKLOAD_NAME		--name -n	-- "CUBE WORKLOAD Name"
}

eval "$(/home/sandman/.local/bin/getoptions parser_definition - "$0") die"
source /home/sandman/.local/libexec/functions.sh

# Remove workload from recfile
cube-env-download $ACCOUNT
recdel -t workload -e "name = '$WORKLOAD_NAME'" environments.rec || die "Could not remove workload froe recfile"
cube-env-upload $ACCOUNT

#delete repo
gh repo delete battellecube/$WORKLOAD_NAME --confirm || die "Don't think repo [$WORKLOAD_NAME] was deleted :("


