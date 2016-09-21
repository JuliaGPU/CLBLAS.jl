import OpenCL.cl

typealias CL_float2 Complex64
typealias CL_double2 Complex128


clblasInvalidCommandQueue             = cl.CL_INVALID_COMMAND_QUEUE
clblasInvalidContext                  = cl.CL_INVALID_CONTEXT
clblasInvalidMemObject                = cl.CL_INVALID_MEM_OBJECT
clblasInvalidDevice                   = cl.CL_INVALID_DEVICE
clblasInvalidEventWaitList            = cl.CL_INVALID_EVENT_WAIT_LIST
clblasOutOfResources                  = cl.CL_OUT_OF_RESOURCES
clblasOutOfHostMemory                 = cl.CL_OUT_OF_HOST_MEMORY
clblasInvalidOperation                = cl.CL_INVALID_OPERATION
clblasCompilerNotAvailable            = cl.CL_COMPILER_NOT_AVAILABLE
clblasBuildProgramFailure             = cl.CL_BUILD_PROGRAM_FAILURE
clblasNotImplemented                  = -1024
clblasNotInitialized                  = -1023
clblasInvalidMatA                     = -1022
clblasInvalidMatB                     = -1021
clblasInvalidMatC                     = -1020
clblasInvalidVecX                     = -1019
clblasInvalidVecY                     = -1018
clblasInvalidDim                      = -1017
clblasInvalidLeadDimA                 = -1016
clblasInvalidLeadDimB                 = -1015
clblasInvalidLeadDimC                 = -1014
clblasInvalidIncX                     = -1013
clblasInvalidIncY                     = -1012
clblasInsufficientMemMatA             = -1011
clblasInsufficientMemMatB             = -1010
clblasInsufficientMemMatC             = -1009
clblasInsufficientMemVecX             = -1008
clblasInsufficientMemVecY             = -1007

@enum clblasOrder clblasRowMajor clblasColumnMajor
@enum clblasTranspose clblasNoTrans clblasTrans clblasConjTrans
@enum clblasUplo clblasUpper clblasLower
@enum clblasDiag clblasUnit clblasNonUnit
@enum clblasSide clblasLeft clblasRight

