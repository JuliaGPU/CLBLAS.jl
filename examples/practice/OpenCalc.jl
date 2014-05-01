function ee(s0, K, vol, iter; dates = 1)
   vals = Array(Float64, dates)
   for ti in 1:dates
       x = rand(Float32, iter) - rand(Float32, iter)
       vol_ti = vol #- (ti * 0.0001)
       S = s0 * exp(x*vol_ti*sqrt(ti) .+ (- (vol_ti^2)/2*ti))
       ee_vals = max(S.-K, 0)
       vals[ti] = sum(ee_vals) / iter
   end
   vals
end

const kernel_source = "
float max(float x, float y){
   if(x >= y)
      return x;
   return y;
}

__kernel void ee(
        const float s0,
        const float K,
        const float vol,
        const int t,
        __global float* data)
{
        int i = get_global_id(0);
        float x = data[i];
        S = s0 * exp(x*vol*sqrt(t) + (- (vol^2)/2*t))
        ee_val = max(S - K, 0)
        vals[ti] = sum(ee_vals) / iter
}
"
