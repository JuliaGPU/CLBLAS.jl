#include <sys/types.h>
#include <stdio.h>

/* Include the clBLAS header. It includes the appropriate OpenCL headers
 */
#include <clBLAS.h>

/* This example uses predefined matrices and their characteristics for
 * simplicity purpose.
 */

#define M  4
#define N  3
#define K  5

static const cl_float alpha = 10;

static const cl_float A[M*K] = {
    11, 12, 13, 14, 15,
    21, 22, 23, 24, 25,
    31, 32, 33, 34, 35,
    41, 42, 43, 44, 45,
};
static const size_t lda = K;        /* i.e. lda = K */

static const cl_float B[K*N] = {
    11, 12, 13,
    21, 22, 23,
    31, 32, 33,
    41, 42, 43,
    51, 52, 53,
};
static const size_t ldb = N;        /* i.e. ldb = N */

static const cl_float beta = 20;

static cl_float C[M*N] = {
    11, 12, 13,
    21, 22, 23,
    31, 32, 33,
    41, 42, 43, 
};
static const size_t ldc = N;        /* i.e. ldc = N */

static cl_float result[M*N];

void print_mem(void const *vp, size_t n)
{
    unsigned char const *p = vp;
    for (size_t i=0; i<n; i++)
        printf("%02x\n", p[i]);
    putchar('\n');
}

int main( void )
{
    cl_int err;
    cl_platform_id platform = 0;
    cl_device_id device = 0;
    cl_context_properties props[3] = { CL_CONTEXT_PLATFORM, 0, 0 };
    cl_context ctx = 0;
    cl_command_queue queue = 0;
    cl_mem bufA, bufB, bufC;
    cl_event event;
    int ret = 0;

    printf("size of size_t:%lu\n", sizeof(size_t)); 
    printf("size of cl_context:%lu\n", sizeof(cl_context));
    printf("size of CL_MEM_READ_ONLY:%lu\n", sizeof(CL_MEM_READ_ONLY));
    printf("size of cl_bool:%lu\n", sizeof(cl_bool));   
    printf("size of clblasOrder:%lu\n", sizeof(clblasOrder));
    printf("size of clblasTranspose:%lu\n", sizeof(clblasTranspose));
    printf("size of clblasStatus:%lu\n", sizeof(clblasStatus));
    printf("size of cl_mem:%lu\n", sizeof(cl_mem));
    printf("size of cl_platform_id:%lu\n", sizeof(cl_platform_id));
    printf("size of cl_event:%lu\n", sizeof(cl_event));
    printf("size of cl_command_queue:%lu\n", sizeof(cl_command_queue));   
    printf("size of cl_kernel:%lu\n", sizeof(cl_kernel));
    printf("size of cl_program:%lu\n", sizeof(cl_program));
    printf("size of cl_device_info: %lu\n", sizeof(cl_device_info));

    
    /* Setup OpenCL environment. */
    err = clGetPlatformIDs( 1, &platform, NULL );
    err = clGetDeviceIDs( platform, CL_DEVICE_TYPE_GPU, 1, &device, NULL );

    props[1] = (cl_context_properties)platform;
    ctx = clCreateContext( props, 1, &device, NULL, NULL, &err );
    queue = clCreateCommandQueue( ctx, device, 0, &err );

    /* Setup clBLAS */
    err = clblasSetup( );

    /* Prepare OpenCL memory objects and place matrices inside them. */
    bufA = clCreateBuffer( ctx, CL_MEM_READ_ONLY, M * K * sizeof(*A),
                          NULL, &err );
    bufB = clCreateBuffer( ctx, CL_MEM_READ_ONLY, K * N * sizeof(*B),
                          NULL, &err );
    bufC = clCreateBuffer( ctx, CL_MEM_READ_WRITE, M * N * sizeof(*C),
                            NULL, &err );
  
    printf("size of buffer A:%lu\n", sizeof(bufA));
    printf("size of platform:%lu\n", sizeof(platform)); 
    printf("sizeof( *A ):%lu\n", sizeof( *A ));    

    print_mem(&platform, sizeof(platform));
    err = clEnqueueWriteBuffer( queue, bufA, CL_TRUE, 0,
        M * K * sizeof( *A ), A, 0, NULL, NULL );
    err = clEnqueueWriteBuffer( queue, bufB, CL_TRUE, 0,
        K * N * sizeof( *B ), B, 0, NULL, NULL );
    err = clEnqueueWriteBuffer( queue, bufC, CL_TRUE, 0,
        M * N * sizeof( *C ), C, 0, NULL, NULL );

   printf("address of cl_event: %p \n", &event);
   print_mem(&event, sizeof(event));
   event = 0;
   
   print_mem(&event, sizeof(event)); 
   /* Call clBLAS extended function. Perform gemm for the lower right sub-matrices */
    err = clblasSgemm( clblasRowMajor, clblasNoTrans, clblasNoTrans, 
                            M, N, K,
                            alpha, bufA, 0, lda,
                            bufB, 0, ldb, beta,
                            bufC, 0, ldc,
                            1, &queue, 0, NULL, &event );
    
     
    printf("major:%d trans:%d\n", clblasRowMajor, clblasNoTrans);    
    printf("address of cl_event: %p \n", &event);  
    print_mem(&event, sizeof(event));
    printf("%s \n", "Waiting for the event");
    /* Wait for calculations to be finished. */
    err = clWaitForEvents( 1, &event );
    printf("size of event:%lu \n", sizeof(event));
    print_mem(&event, sizeof(event));

    printf("%s \n", "reading the result");
    /* Fetch results of calculations from GPU memory. */
    err = clEnqueueReadBuffer( queue, bufC, CL_TRUE, 0,
                                M * N * sizeof(*result),
                                result, 0, NULL, NULL );

    for(int i= 0; i < 12; i++){
       printf("%d element:%f \n",i, result[i]);
    }
    /* Release OpenCL memory objects. */
    clReleaseMemObject( bufC );
    clReleaseMemObject( bufB );
    clReleaseMemObject( bufA );

    /* Finalize work with clBLAS */
    clblasTeardown( );

    /* Release OpenCL working objects. */
    clReleaseCommandQueue( queue );
    clReleaseContext( ctx );

    return ret;
}
