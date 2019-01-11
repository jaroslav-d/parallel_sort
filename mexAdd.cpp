#include "mex.h"
#include "matrix.h"
#include <omp.h>

/**
 * Call signature: C = mexAdd(A, B)
 */
void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[]) 
{
    // Input validation (omitted)
    // ...
    // ...

    mwSize n1 = mxGetNumberOfElements(prhs[0]);
    mwSize n2 = mxGetNumberOfElements(prhs[1]);
    if (n1 != n2)
    {
        mexErrMsgIdAndTxt("example:add:prhs", "A and B must have the same number of elements.");
    }
    double *A = mxGetPr(prhs[0]);
    double *B = mxGetPr(prhs[1]);
    // Allocate output matrix.
    mxArray *mC = mxCreateDoubleMatrix(n1, 1, mxREAL);
    double *C = mxGetPr(mC);
    
    // Compute the sum in parallel.
    #pragma omp parallel for default(none)
    for (int i = 0;i < n1;i++)
    {
        C[i] = A[i] + B[i];
    }
    
    // Return the sum.
    plhs[0] = mC;
}