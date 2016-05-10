#!/bin/bash

DIR=$1
GIT=$2
BRANCH=$3

if [ "${DIR}" == "" ]; then
	echo "usage: $0 name git_url [branch]"
	exit 1
fi

if [ "${GIT}" == "" ]; then
	echo "usage: $0 name git_url [branch]"
	exit 1
fi

if [ "${BRANCH}" == "" ]; then
	BRANCH=master
fi

if [ ! -d "${DIR}" ]; then \
	 git clone -b ${BRANCH} ${GIT}
	 cd ${DIR}
	 carton install -p ../local
else
	 cd ${DIR}
	 git pull
	 carton install -p ../local
fi