#! /bin/bash

LIBUTILS_PROGRESS_CURSOR_LEFT=false

# TODO maybe change usage to
#
#   LIBUTILS_PROGRESS_PROMPT="analyzing..."
#   progress_show idx ${#array[@]}
#   progress_done # unsets LIBUTILS_PROGRESS_PROMPT variable
#
# both functions accept the prompt string as optional last parameter
#
# TODO maybe pass array as reference indicated by e.g. -
#
#   limit=${#${2#-}[@]}
#

function progress() {
	local prompt=$1
	local current=$2
	local limit=$3

	prompt+="$((current * 100 / limit))%"

	$LIBUTILS_PROGRESS_CURSOR_LEFT && prompt+="\r" || prompt="\r$prompt"

	echo -en "${prompt}"
}

function progress_done() {
	local prompt=$1

	$LIBUTILS_PROGRESS_CURSOR_LEFT || prompt="\r$prompt"

	echo -e "${prompt}done."
}

