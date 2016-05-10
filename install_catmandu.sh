#!/bin/bash

GIT=$1
BRANCH=$2

if [ "${GIT}" == "" ]; then
	echo "usage: $0 git_url [branch]"
	exit 1
fi

if [ "${BRANCH}" == "" ]; then
	BRANCH=dev
fi

if [ ! -d "Catmandu" ]; then 
	git clone -b ${BRANCH} ${GIT}
	cd Catmandu
	carton install -p ../local
else
	cd Catmandu
	git pull
	carton install -p ../local
fi