import OpenCL

immutable CL_float2
   n1::OpenCL.CL_float
   n2::OpenCL.CL_float
end

immutable CL_double2
   n1::OpenCL.CL_double
   n2::OpenCL.CL_double
end

typealias FloatComplex CL_float2
typealias DoubleComplex CL_double2

clblasInvalidCommandQueue             = OpenCL.CL_INVALID_COMMAND_QUEUE
clblasInvalidContext                  = OpenCL.CL_INVALID_CONTEXT
clblasInvalidMemObject                = OpenCL.CL_INVALID_MEM_OBJECT
clblasInvalidDevice                   = OpenCL.CL_INVALID_DEVICE
clblasInvalidEventWaitList            = OpenCL.CL_INVALID_EVENT_WAIT_LIST
clblasOutOfResources                  = OpenCL.CL_OUT_OF_RESOURCES
clblasOutOfHostMemory                 = OpenCL.CL_OUT_OF_HOST_MEMORY
clblasInvalidOperation                = OpenCL.CL_INVALID_OPERATION
clblasCompilerNotAvailable            = OpenCL.CL_COMPILER_NOT_AVAILABLE
clblasBuildProgramFailure             = OpenCL.CL_BUILD_PROGRAM_FAILURE
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


