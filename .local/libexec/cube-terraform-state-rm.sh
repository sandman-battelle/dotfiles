#!/usr/bin/env bash


# shellcheck disable=SC2034
VERSION=0.8.1-5-g0ec94d4-dirty

# shellcheck disable=SC1083
# @getoptions
parser_definition() {
	setup   REST help:usage -- "Usage: cube env state-import [options]" ''
	msg -- 'Options:'
	disp	:usage		--help -h
	disp	VERSION		--version -v
	param	ADDR		--addr -a	-- "Address to remove from the terraform state"
}

# @end

eval "$(/home/sandman/.local/bin/getoptions parser_definition - "$0") exit 1"

source /home/sandman/.local/libexec/functions.sh

cube-env-eval || exit 1

cube-terraform-state-rm $ADDR