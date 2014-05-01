/*
*
* Using Random123 counter-based random number generators
* Copyright 2010-2011, D. E. Shaw Research.
* All rights reserved.
*
*
* Copyright 2014 Erkin Kanlioglu
*/
#include <Random123/philox.h>

__kernel void rand_cl( const int seed, __global float4* result)
{
   const float R123_0x1p_31f = (1.f/(1024.f*1024.f*1024.f*2.f));

   unsigned tid = get_global_id(0);

   philox4x32_ctr_t c = {{tid + seed, tid+seed+1, tid+seed+2, tid+seed+3}};
   philox4x32_key_t k = {{0xfeedbeef,0xf00dcafe,0xbeadbeef,0xbeeff00d}};

   union {
       philox4x32_ctr_t c;
       int4 i;
   } u;

   u.c = philox4x32(c, k);

   __local float4 res;

   res.x = ((u.i.x&0x7fffffc0) + (u.i.x&0x40))*R123_0x1p_31f;
   res.y = ((u.i.y&0x7fffffc0) + (u.i.y&0x40))*R123_0x1p_31f;
   res.z = ((u.i.z&0x7fffffc0) + (u.i.z&0x40))*R123_0x1p_31f;
   res.w = ((u.i.w&0x7fffffc0) + (u.i.w&0x40))*R123_0x1p_31f;

   result[tid] = res;
}
