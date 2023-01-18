#!/bin/bash

if [ $# -ge 1 ]
then
    case "$1" in
        "-p") echo "aproksymacja prostej z uzyciem metody gaussa"; $(cc -Wall -ansi -pedantic -I$(pwd) ./*.c ./approx/prosta.c);;
        "-ig") echo "aproksymacja interpolatora z uzyciem metody gaussa"; $(cc -Wall -ansi -pedantic -Imatrix -Igaus -I$(pwd) ./*.c ./gaus/*.c ./approx/interpolator.c ./matrix/*.c);;
        "-is") echo "aproksymacja interpolatora z uzyciem metody gaussa-seidla"; $(cc -Wall -ansi -pedantic -Imatrix -Igauss_seidel -I$(pwd) ./*.c ./gauss_seidel/*.c ./approx/interpolator.c ./matrix/*.c);;
        "-bg") echo "aproksymacja na bazie z uzyciem metody gaussa"; $(cc -Wall -ansi -pedantic -Imatrix -Igaus -I$(pwd) ./*.c ./gaus/*.c ./approx/aproksymator_na_bazie.c ./matrix/*.c);;
        "-bs") echo "aproksymacja na bazie z uzyciem metody gaussa-seidla"; $(cc -Wall -ansi -pedantic -Imatrix -Igauss_seidel -I$(pwd) ./*.c ./gauss_seidel/*.c ./approx/aproksymator_na_bazie.c ./matrix/*.c);;
        *) echo "Niepoprawna opcja, dostepne opcje: [-p, -ig, -is, -bg, -bs]"
    esac
else
    echo "Nie podano opcji, dostepne opcje: [-p, -ig, -is, -bg, -bs]"
fi
