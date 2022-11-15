#!/usr/bin/env bash


# shellcheck disable=SC2034
VERSION=0.6.1-2-g38ae293-dirty
WORKLOAD_TYPES='workload | platform | module' 

# shellcheck disable=SC1083
# @getoptions
parser_definition() {
	array() { param ":append_array $@"; }
	msg -- 'Create repository in GitHub and runs all configuration' ''
	setup   REST help:usage -- "Usage: cube repo create [options]..." ''
	msg -- 'Options:'
	disp    :usage		--help -h
	disp    VERSION		--version
	param	REPO_NAME	--repo-name -n -- 'Name of the GitHub repository'
	flag	GHAE		--{no-}ghae -g +g -- 'Use GHAE instead of GitHub.com'
	option	ORG			--organization -o init:=battellecube -- 'GitHub organization name'
	option  TYPE		--repo-type -t init:=workload  pattern:"$WORKLOAD_TYPES" -- 'Repository type'
	flag	PROTECT		--{no-}protection -p +p init:=1 -- 'Set GitHub repo protections'
	array	TOPIC		--topic init:'TOPICS=()' var:TOPIC -- 'Add custom topic to repo.  Multiple `--topic`s allowed'
	flag	DEBUG		--debug -- 'Turn on debug out for this command'
	msg -- 'Examples:' ''
	msg -- '  Adding topics:'
	msg -- '    cube repo create --topic TOPIC1'
	msg -- '    cube repo create --topic "TOPIC1 TOPIC2"'
	msg -- '    cube repo create --topic=TOPIC1,TOPIC2'
	msg -- '    cube repo create --topic={TOPIC1,TOPIC2}'
}
# @end

append_array() {
	IFS+=,
	eval "$1+=(\`echo \"\$OPTARG\"\`)"
}

eval "$(/home/sandman/.local/bin/getoptions parser_definition - "$0") exit 1"

if [ $DEBUG ]
then
	cat <<-HERE
	REPO_NAME: $REPO_NAME
	GHAE: $GHAE
	ORG: $ORG
	TYPE: $TYPE
	PROTECT: $PROTECT
	TOPICS: $(IFS=', '; echo "${TOPIC[*]}") (${#TOPIC[@]})
	HERE
fi
