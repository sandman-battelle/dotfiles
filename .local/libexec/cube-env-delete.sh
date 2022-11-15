#!/usr/bin/env bash

# shellcheck disable=SC1083
# @getoptions
parser_definition() {
	setup   REST help:usage -- "Usage: cube env delete [options]" ''
	msg -- 'Options:'
	disp		:usage			--help -h
	disp		VERSION			--version -v
	param		NAME			--name -n	-- "CUBE Environment Name"
	param		WORKLOAD --workload -w -- "CUBE Workload Name"
	param		ACCOUNT			--account -a init:="cubetfstateprod" -- "CUBE State Storage Account Name"
	flag		DELETE_BRANCH		--delete -d -- "Delete Git Branch"
}

# @end

eval "$(/home/sandman/.local/bin/getoptions parser_definition - "$0") exit 1"
source /home/sandman/.local/libexec/functions.sh

echo "...setting up environment"
cube-env-download $ACCOUNT || exit 1
cube-env-set-local $NAME $WORKLOAD || exit 1

echo "...deleting service principal"
cube-env-delete-app || exit 1

echo "...deleting github environment"
cube-env-gh-environment-delete || exit 1

[ $DELETE_BRANCH ] && {
	echo "...deleting github branch"
	cube-env-gh-branch-delete || exit 1
}

echo "...deleting environment record"
cube-env-delete-record $NAME $WORKLOAD $ACCOUNT || exit 1

echo "...succfully deleted ${WORKLOAD}-${NAME} environment"
