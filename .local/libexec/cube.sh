#!/usr/bin/env bash

# shellcheck disable=SC2034
VERSION=0.6.1-2-g38ae293-dirty

# shellcheck disable=SC1083
# @getoptions
parser_definition() {
	setup   REST help:usage -- "Usage: cube [options]... [arguments]..." ''
	msg -- 'Options:'
	disp    :usage  -h --help
	disp    VERSION    --version -v

	msg -- '' 'Commands:'
	cmd env -- "Manages CUBE environments"
	cmd log -- "WIP: Currently just shows log setup information"
	cmd status -- "WIP: Shows environment status information"
	cmd repo -- "Manages CUBE repositories"
	cmd workload -- "Manages CUBE workloads"
}
# @end


eval "$(/home/sandman/.local/bin/getoptions parser_definition - "$0") exit 1"

if [ $# -gt 0 ]; then
	cmd=$1
	shift
	case $cmd in
		env)
			/home/sandman/.local/libexec/cube-env.sh "$@"
			;;
		log)
			/home/sandman/.local/libexec/cube-log.sh "$@"
			;;
		status)
		  /home/sandman/.local/libexec/cube-status.sh "$@"
			;;
		repo)
			/home/sandman/.local/libexec/cube-repo.sh "$@"
			;;
		workload)
			/home/sandman/.local/libexec/cube-workload.sh "$@"
			;;
		--) # no subcommand, arguments only
	esac
fi
