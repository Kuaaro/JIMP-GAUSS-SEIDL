#include "util.h"
#include <stdlib.h>

int
util (matrix_t * eqs)
{
    if(have_diagonal_zeros(eqs))
        return 1;
    gaus_seidel(eqs);
    return 0;
}
