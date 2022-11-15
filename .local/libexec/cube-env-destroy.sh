#!/usr/bin/env bash

# shellcheck disable=SC1083
# @getoptions
parser_definition() {
	setup   REST help:usage -- "Usage: cube workload destroy [options]" ''
	msg -- 'Options:'
	disp	:usage		--help -h
	disp	VERSION		--version -v
	flag	PLATFORM		--platform -p -- "Initialize a Platform"
}

# @end

eval "$(/home/sandman/.local/bin/getoptions parser_definition - "$0") exit 1"

source /home/sandman/.local/libexec/functions.sh

cube-env-eval || exit 1
cube-env-validate || exit 1

[ $PLATFORM ] && {
	cube-platform-terraform-destroy || exit 1
} 

[ $PLATFORM ] || {
	cube-workload-terraform-destroy || exit 1
} 




