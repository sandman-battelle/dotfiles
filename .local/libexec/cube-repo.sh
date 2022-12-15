#!/usr/bin/env bash


# shellcheck disable=SC2034
VERSION=0.8.1-5-g0ec94d4-dirty

# shellcheck disable=SC1083
# @getoptions
parser_definition() {
	setup   REST help:usage -- "Usage: cube repo [options]... [command]" ''
	msg -- 'Options:'
	disp    :usage  -h --help
	disp    VERSION    --version

	msg -- '' 'Commands:'
	cmd mirror -- "Mirror repos"
	cmd create -- "Creates a CUBE git repository"
	cmd delete -- "Deletes a CUBE git repository"
}
# @end

eval "$(/home/sandman/.local/bin/getoptions parser_definition - "$0") exit 1"

if [ $# -gt 0 ]; then
	cmd=$1
	shift
	case $cmd in
		mirror)
			/home/sandman/.local/libexec/cube-repo-mirror.sh "$@"
			;;
		create)
			/home/sandman/.local/libexec/cube-repo-create.sh "$@"
			;;
		delete)
			/home/sandman/.local/libexec/cube-repo-delete.sh "$@"
			;;
		--) # no subcommand, arguments only
	esac
fi

