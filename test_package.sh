#!/bin/bash

DIR=$1

LIBS=../Catmandu/lib:../local/lib/perl5

if [ "${DIR}" == "" ]; then
	echo "usage: $0 name"
	exit 1
fi

cd ${DIR}
PERL5LIB=${LIBS}:local/lib/perl5 perl ./Build.PL
PERL5LIB=${LIBS}:local/lib/perl5 ./Build build
PERL5LIB=${LIBS}:local/lib/perl5 ./Build test
PERL5LIB=${LIBS}:local/lib/perl5 ./Build realclean