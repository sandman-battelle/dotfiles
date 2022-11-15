#!/usr/bin/env bash

# shellcheck disable=SC1083
# @getoptions
parser_definition() {
	setup   REST help:usage -- "Usage: cube workload apply [options]" ''
	msg -- 'Options:'
	disp	:usage		--help -h
	disp	VERSION		--version -v
	param	USERID		--uid -i	-- "User Id to add to the specified group"
	flag	USER		--user -u -- "Remove user from the users group"
	flag	ADMIN		--admin -a -- "Remove user from the admins group"
	flag	MANAGER		--manager -m -- "Remove user from the managers group"
}

# @end

eval "$(/home/sandman/.local/bin/getoptions parser_definition - "$0") exit 1"

source /home/sandman/.local/libexec/functions.sh

cube-env-eval || exit 1

[ $USER ] && {
	cube-workload-remove-from-users-group $USERID || exit 1
} 

[ $ADMIN ] && {
	cube-workload-remove-from-admins-group $USERID || exit 1
}

[ $MANAGER ] && {
	cube-workload-remove-from-managers-group $USERID || exit 1
}







