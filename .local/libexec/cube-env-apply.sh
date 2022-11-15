#!/usr/bin/env bash

# shellcheck disable=SC1083
# @getoptions
parser_definition() {
	setup   REST help:usage -- "Usage: cube workload apply [options]" ''
	msg -- 'Options:'
	disp	:usage		--help -h
	disp	VERSION		--version -v
	flag	PLATFORM		--platform -p -- "Initialize a Platform"
	flag	DEV		--dev -d -- "Use Development Settings"
}

# @end

eval "$(/home/sandman/.local/bin/getoptions parser_definition - "$0") exit 1"

source /home/sandman/.local/libexec/functions.sh

cube-env-eval || exit 1
cube-env-validate || exit 1

[ $PLATFORM ] && {
	cube-platform-terraform-apply || exit 1
} 

[ $PLATFORM ] || {
	if [ $DEV ]; then
		cube-workload-terraform-dev-apply || exit 1
	else
		cube-workload-terraform-apply || exit 1
	fi
} 






