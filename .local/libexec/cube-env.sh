#!/usr/bin/env bash


# shellcheck disable=SC2034
VERSION=0.8.1-5-g0ec94d4-dirty

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
	cmd list -- "List a CUBE environment"
	cmd set -- "Sets a CUBE environment"
	cmd apply -- "Terraform apply workload"
	cmd destroy -- "Terraform destory workload"
	cmd init -- "Terraform init workload"
	cmd grant -- "Grant users access to a workload"
	cmd ungrant -- "Remove users access to a workload"
	cmd state-import -- "Import resource into terraform state"
	cmd state-rm -- "Remove instance from terraform state "
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
		list)
			/home/sandman/.local/libexec/cube-env-list.sh "$@"
			;;
		set)
			/home/sandman/.local/libexec/cube-env-set.sh "$@"
			;;
		apply)
			/home/sandman/.local/libexec/cube-workload-apply.sh "$@"
			;;
		destroy)
			/home/sandman/.local/libexec/cube-workload-destroy.sh "$@"
			;;
		init)
			/home/sandman/.local/libexec/cube-workload-init.sh "$@"
			;;
		grant)
			/home/sandman/.local/libexec/cube-workload-grant.sh "$@"
			;;
		ungrant)
			/home/sandman/.local/libexec/cube-workload-ungrant.sh "$@"
			;;
		state-import)
			/home/sandman/.local/libexec/cube-terraform-state-import.sh "$@"
			;;
		state-rm)
			/home/sandman/.local/libexec/cube-terraform-state-rm.sh "$@"
			;;
		--) # no subcommand, arguments only
	esac
fi



