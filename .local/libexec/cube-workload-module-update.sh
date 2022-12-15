#!/usr/bin/env bash


# shellcheck disable=SC1083
# @getoptions
parser_definition() {
	setup   REST help:usage			-- "Usage: cube workload update [options]" ''
	msg								-- 'Options:'
	disp    :usage  -h --help

}
# @end

eval "$(/home/sandman/.local/bin/getoptions parser_definition - "$0") exit 1"

source /home/sandman/.local/libexec/functions.sh

[ -f .cuberc ] || die "You are not in a workload repo"

name=0
version=1
cube workload module -r | while read l; do
	module=($(echo $l | awk -F= '{print $1, $2}'))
	cd modules/${module[name]};
	echo "Changing ${module[name]} from $(git describe --tags --dirty) to ${module[version]}"
	git checkout -q ${module[version]}
	cd - >/dev/null
done
