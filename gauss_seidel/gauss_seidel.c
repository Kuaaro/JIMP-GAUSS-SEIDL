#include "matrix.h"
#include <stdlib.h>

int have_diagonal_zeros(matrix_t * in) /*sprawdza, czy macierz zawiera zero/ra na przekatnej*/
{
    int i;
    for(i=0; i<in->rn; i++)
        if(!in->e[i*(in->cn+1)])
            return 1;
    return 0;
}

void gaus_seidel(matrix_t * in)
{
    double *sol, delta = 1, temp; /*sol - tablica z rozwiazaniami, delta- roznice wynikow pomiedzy iteracjami, temp - zmienna pomocnicza*/
    int i, j, ct = 1000000; /*i, j - zmienne do iteracji, ct - zmienna zabezpieczajca, zeby metoda nie itterowala sie w nieskonczonosc dla niepoprawnych macierzy*/
    sol = calloc(in->rn, sizeof(double)); /*zalokowanie pamieci*/
    while(delta && ct) /*iteracja dopoki wyniki nie przestana sie zmieniac lub dopoki limit nie zostanie osiagniety*/
    {
        delta = 0; /*wyzerowanie roznicy pomiedzy iteracjami*/
        for(i=0; i<in->rn; i++) /*przejscie po wszystkich wierszach  macierzy*/
        {
            delta += sol[i]; /*dodanie wartosci poczatkowej do zmiennej delta*/
            temp = in->e[(i+1)*in->cn-1]; /*dodanie do temp wyniku rozwiazania iterowanego rownania*/
            for(j=0; j<in->cn-1; j++) /*przejscie po wszystkich elementach wiersza*/
            {
                if(j==i) /*jezeli dany element rzedu znajduje sie na glownej przekatnej, pomijamy go*/
                    continue;
                temp -= in->e[i*in->cn+j]*sol[j]; /*odejmujemy pozostale elementy, uprzednio mnozac je przez odpowiadajace im rozwiazanie*/
            }
            temp /= in->e[i*(in->cn+1)]; /*podzielenie przez odpowiadajacy element na glownej przekatnej*/
            delta -= temp; /*odejmuje od delty nowe rozwiazanie*/
            sol[i] = temp; /*podmieniam rozwiazanie*/
        }
        ct--; /*obnizenie licznika o jeden*/
    }
    for(i=0; i<in->rn; i++) /*iteracja przez wszystkie elementy rozwiazania*/
        in->e[(i+1)*in->cn-1]=sol[i]; /*podmienienie rozwiazan ukladow rownan na wartosci poszczegolnych elementow*/
    free(sol); /*zwolnienie tablicy*/
}
