#!/usr/bin/env bash


# shellcheck disable=SC2034
VERSION=0.6.1-2-g38ae293-dirty

# shellcheck disable=SC1083
# @getoptions
parser_definition() {
	setup   REST help:usage -- "Usage: cube env [options]... [arguments]..." ''
	msg -- 'Options:'
	disp    :usage  -h --help
	disp    VERSION    --version

	cmd create -- 'Create a new workload'
	msg -- '' 'Commands:'
}
# @end

eval "$(/home/sandman/.local/bin/getoptions parser_definition - "$0") exit 1"

if [ $# -gt 0 ]; then
	cmd=$1
	shift
	case $cmd in
		create)
			/home/sandman/.local/libexec/cube-workload-create.sh "$@"
			;;
		--) # no subcommand, arguments only
	esac
fi



