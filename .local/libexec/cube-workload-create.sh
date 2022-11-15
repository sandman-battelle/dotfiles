#!/usr/bin/env bash

# shellcheck disable=SC1083
# @getoptions
parser_definition() {
	setup   REST help:usage -- "Usage: cube workload create [options]" ''
	msg -- 'Options:'
	disp	:usage		-h --help
	disp	VERSION		-v --version
	param	WORKLOAD	-w --workload		-- "CUBE Workload Name"
	option	SUB			-s --subscription	-- "Azure subscription for workload"
}

eval "$(/home/sandman/.local/bin/getoptions parser_definition - "$0") die"

source /home/sandman/.local/libexec/functions.sh


