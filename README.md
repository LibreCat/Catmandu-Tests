# Catmandu-Tests

Run test scripts of many Catmandu packages against the main (development)
version of Catmandu. User `Docker` or set up your own sandboxed perl environment as described in the section **Installation**.

## Run tests using Docker

Just run
```
$ docker build -t catmandu-tests .
```
If this image build is successful everything is fine.

## Installation

Need a clean Perl installation without any installed modules except:

 * cpanm
 * Carton

E.g.

    $ plenv install --list
    $ plenv install <VERSION>
    $ plenv local <VERSION>
    $ plenv install-cpanm
    $ plenv rehash
    $ cpanm Carton

## Usage

Clone the Catmandu packages

    $ ./make.pl install

Run the tests

    $ ./make.pl test
