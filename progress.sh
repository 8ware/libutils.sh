#! /bin/bash
#
# Usage:
#
#   source progress.sh
#
#   LIBUTILS_PROGRESS_PROMPT="progress: "
#   for idx in $(seq ${#array[@]}); do
#       progress_show idx array
#       # ...
#   done
#   progress_done "progress..."
#

#
# progress_show  idx    files     [prompt]
# progress_show $idx ${#files[@]} [prompt]
# progress_show $idx    files     [prompt]
# progress_show  idx ${#files[@]} [prompt]
#
function progress_show() {
	local current=$1
	local limit=$2
	local prompt=$3

	grep -q '[1-9][0-9]*' <<< "$current" || eval "current=\$$current"
	grep -q '[1-9][0-9]*' <<< "$limit" || eval "limit=\${#$limit[@]}"
	[ "$prompt" ] || prompt=$LIBUTILS_PROGRESS_PROMPT

	echo -en "\r${prompt}$((current * 100 / limit))%"
}

#
# progress_done [prompt]
#
function progress_done() {
	local prompt=$1

	[ "$prompt" ] || prompt=$LIBUTILS_PROGRESS_PROMPT

	echo -e "\r${prompt}done."
}

