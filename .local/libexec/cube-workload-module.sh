#!/usr/bin/env bash


releases() {
# For each module we want to get something like name=version
git submodule foreach gh release list	`# get all the module info` \
	| awk -f <(cat - <<-'END'
		BEGIN { ORS="" }
		/Latest/{print $1 "\n"}
		/Entering/{print $2 "\t"}
		END
	)									`# awk-out the module paths and versions as TSVs`\
	| tr '\t' '='						`# get us to path=version` \
	| tr -d "'"							`# strip any quoting` \
	| awk -F/ '{print $2}'				`# get "basename" of path`
}

# shellcheck disable=SC1083
# @getoptions
parser_definition() {
	setup   REST help:usage	-- "Usage: cube workload module [options]...[COMMAND]" ''
	msg -- 'Options:'
	disp    :usage		-h	--help
	flag	RELEASES		-r	init:@unset	-- "Show latest available release of each module"

	msg -- '' 'Commands:'
	cmd list	-- 'List all modules'
	cmd update	-- 'Update modules of a workload'
	cmd add		-- 'Add a module to a workload'

}
# @end

eval "$(/home/sandman/.local/bin/getoptions parser_definition - "$0") exit 1"

if [ ${RELEASES+is_set} ]; then
	releases
	exit
fi
if [ $# -gt 0 ]; then
	cmd=$1
	shift
	case $cmd in
		list)
			/home/sandman/.local/libexec/cube-workload-module-list.sh $@
			;;
		update)
			/home/sandman/.local/libexec/cube-workload-module-update.sh $@
			;;
		add)
			/home/sandman/.local/libexec/cube-workload-module-add.sh $@
			;;
		--) # no subcommand, arguments only
	esac
fi
