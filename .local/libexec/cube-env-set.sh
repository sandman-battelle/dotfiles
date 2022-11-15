#!/usr/bin/env bash

# shellcheck disable=SC1083
# @getoptions
parser_definition() {
	setup   REST help:usage -- "Usage: cube env set [options]" ''
	msg -- 'Options:'
	disp	:usage		--help -h
	disp	VERSION		--version -v
	param	NAME		--name -n	-- "CUBE Environment Name"
	param WORKLOAD --workload -w -- "CUBE Workload Name"
	param	ACCOUNT		--account -a init:="cubetfstateprod" -- "CUBE State Storage Account Name"
}

# @end

eval "$(/home/sandman/.local/bin/getoptions parser_definition - "$0") exit 1"

source /home/sandman/.local/libexec/functions.sh

cube-env-download $ACCOUNT || exit 1
cube-env-set-local $NAME $WORKLOAD || exit 1




