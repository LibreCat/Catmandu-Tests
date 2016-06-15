# Install and test a bunch of Catmandu
# modules, integration tests

FROM tianon/perl

RUN cpanm Carton

ADD . /src
WORKDIR /src

RUN ./make.pl install

RUN ./make.pl test
