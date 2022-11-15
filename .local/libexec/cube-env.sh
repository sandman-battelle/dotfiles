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

	msg -- '' 'Commands:'
	cmd storage -- "Manages CUBE environment storage"
	cmd create -- "Creates a CUBE environment"
	cmd delete -- "Deletes a CUBE environment"
	cmd set -- "Sets a CUBE environment"
	cmd apply -- "Terraform apply environment"
	cmd destroy -- "Terraform destory environment"
	cmd init -- "Terraform init environment"
	cmd grant -- "Grant users access to a environment"
	cmd ungrant -- "Remove users access to a environment"
}
# @end

eval "$(/home/sandman/.local/bin/getoptions parser_definition - "$0") exit 1"

if [ $# -gt 0 ]; then
	cmd=$1
	shift
	case $cmd in
		storage)
			/home/sandman/.local/libexec/cube-env-storage.sh "$@"
			;;
		create)
			/home/sandman/.local/libexec/cube-env-create.sh "$@"
			;;
		delete)
			/home/sandman/.local/libexec/cube-env-delete.sh "$@"
			;;
		set)
			/home/sandman/.local/libexec/cube-env-set.sh "$@"
			;;
		apply)
			/home/sandman/.local/libexec/cube-env-apply.sh "$@"
			;;
		destroy)
			/home/sandman/.local/libexec/cube-env-destroy.sh "$@"
			;;
		init)
			/home/sandman/.local/libexec/cube-env-init.sh "$@"
			;;
		grant)
			/home/sandman/.local/libexec/cube-env-grant.sh "$@"
			;;
		ungrant)
			/home/sandman/.local/libexec/cube-env-ungrant.sh "$@"
			;;
		--) # no subcommand, arguments only
	esac
fi



