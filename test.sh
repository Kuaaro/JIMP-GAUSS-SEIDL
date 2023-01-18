#!/bin/bash

$(cc -Wall -ansi -pedantic -I$(pwd) ./*.c ./approx/prosta.c)
$($(pwd)/a.out -s splines_p1 -p ./test/dane.1)
$($(pwd)/a.out -s splines_p2 -p ./test/dane.2)

$(cc -Wall -ansi -pedantic -Imatrix -Igaus -I$(pwd) ./*.c ./gaus/*.c ./approx/interpolator.c ./matrix/*.c)
$($(pwd)/a.out -s splines_ig1 -p ./test/dane.1)
$($(pwd)/a.out -s splines_ig2 -p ./test/dane.2)

$(cc -Wall -ansi -pedantic -Imatrix -Igauss_seidel -I$(pwd) ./*.c ./gauss_seidel/*.c ./approx/interpolator.c ./matrix/*.c)
$($(pwd)/a.out -s splines_is1 -p ./test/dane.1)
$($(pwd)/a.out -s splines_is2 -p ./test/dane.2)

$(cc -Wall -ansi -pedantic -Imatrix -Igaus -I$(pwd) ./*.c ./gaus/*.c ./approx/aproksymator_na_bazie.c ./matrix/*.c)
$($(pwd)/a.out -s splines_bg1 -p ./test/dane.1)
$($(pwd)/a.out -s splines_bg2 -p ./test/dane.2)

$(cc -Wall -ansi -pedantic -Imatrix -Igauss_seidel -I$(pwd) ./*.c ./gauss_seidel/*.c ./approx/aproksymator_na_bazie.c ./matrix/*.c)
$($(pwd)/a.out -s splines_bs1 -p ./test/dane.1)
$($(pwd)/a.out -s splines_bs2 -p ./test/dane.2)
