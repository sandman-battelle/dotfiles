#!/usr/bin/env bash

# shellcheck disable=SC1083
# @getoptions
parser_definition() {
	setup   REST help:usage -- "Usage: cube env storage delete [options]... <action> NAME" ''
	msg -- 'Options:'
	disp    :usage			--help -h
	disp    VERSION			--version
	param	ACCOUNT			--account init:="cubetfstateprod" -- "CUBE State Storage Account Name"
  param	NAME			--name -- "Blob Storage Container Name"
}

# @end

eval "$(/home/sandman/.local/bin/getoptions parser_definition - "$0") exit 1"

echo az storage container delete --name $NAME --account-name $ACCOUNT
