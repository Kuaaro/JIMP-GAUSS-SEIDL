#include "util.h"
#include <stdlib.h>

int
util (matrix_t * eqs)
{
  if (eqs != NULL) {
    pivot_ge_in_situ_matrix (eqs);
    if (bs_matrix (eqs) == 0) {
        #ifdef DEBUG2
    write_matrix(eqs, stderr);
#endif
      return 0;
    }
    else {
      return 1;
    }
  }
  else
    return 1;
}
