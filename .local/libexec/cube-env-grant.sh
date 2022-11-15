#!/usr/bin/env bash

# shellcheck disable=SC1083
# @getoptions
parser_definition() {
	setup   REST help:usage -- "Usage: cube workload apply [options]" ''
	msg -- 'Options:'
	disp	:usage		--help -h
	disp	VERSION		--version -v
	param	USERID		--uid -i	-- "User Id to add to the specified group"
	flag	USER		--user -u -- "Add user to the users group"
	flag	ADMIN		--admin -a -- "Add user to the admins group"
	flag	MANAGER		--manager -m -- "Add user to the managers group"
}

# @end

eval "$(/home/sandman/.local/bin/getoptions parser_definition - "$0") exit 1"

source /home/sandman/.local/libexec/functions.sh

cube-env-eval || exit 1

[ $USER ] && {
	cube-workload-add-to-users-group $USERID || exit 1
} 

[ $ADMIN ] && {
	cube-workload-add-to-admins-group $USERID || exit 1
}

[ $MANAGER ] && {
	cube-workload-add-to-managers-group $USERID || exit 1
}







