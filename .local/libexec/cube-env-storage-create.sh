#!/usr/bin/env bash

cube-env-recfile-gen()
{
	cat <<-HERE
	%rec: environment
	%key: id
	%auto: id
	%type: id uuid
	%type: workload rec workload
	%mandatory: name platform cidr workload sub account
	%allowed: description
	%unique: name platform cidr workload sub account
	%constraint: cidr ~ '^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\/(3[0-2]|[1-2][0-9]|[0-9]))$'

	%rec: workload
	%key: name

	%rec: tenant

	%rec: cloud

	HERE
}

# shellcheck disable=SC1083
# @getoptions
parser_definition() {
	setup   REST help:usage -- "Usage: cube env storage create [options]... <action> NAME" ''
	msg -- 'Options:'
	disp    :usage			--help -h
	disp    VERSION			--version -v
	param	ACCOUNT			--account -a init:="cubetfstateprod" -- "CUBE State Storage Account Name"
}

# @end

eval "$(/home/sandman/.local/bin/getoptions parser_definition - "$0") exit 1"

source /home/sandman/.local/libexec/functions.sh

echo -e "\n---------WARNING---------WARNING---------\n"
echo -e "This will overwrite all of your environment data.\n"
echo -e "If you want to continue then press 'y'.\n"

echo
read key
[[ $key == "y" ]] || exit 3

echo -e "\n---------WARNING---------WARNING---------\n"
echo -e "Wait a minute...did you mean to click yes?\n"
echo -e "If you want to continue then press 'y'.\n"

echo
read key
[[ $key == "y" ]] || exit 3

az storage container create --name environments --account-name $ACCOUNT
cube-env-recfile-gen > environments.rec
cube-env-upload $ACCOUNT
