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
 $ carton

Clone the Catmandu packages 

 $ ./make.pl install

Run the tests

 $ ./make.pl test
