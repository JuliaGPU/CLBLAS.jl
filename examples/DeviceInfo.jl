import CLBLAS
import OpenCL

const cl = OpenCL
const clblas = CLBLAS

for platform in cl.platforms()
    if platform[:name] == "Portable Computing Language"
        warn("Portable Computing Language platform not yet supported")
        continue
    end

    for device in cl.devices(platform)
        @printf("====================================================\n")
        @printf("Platform name:    %s\n",  platform[:name])
        @printf("Platform profile: %s\n",  platform[:profile])
        @printf("Platform vendor:  %s\n",  platform[:vendor])
        @printf("Platform version: %s\n",  platform[:version])
        @printf("----------------------------------------------------\n")
        @printf("Device name: %s\n", device[:name])
        @printf("Device type: %s\n", device[:device_type])
        @printf("Device mem: %i MB\n",           device[:global_mem_size] / 1024^2)
        @printf("Device max mem alloc: %i MB\n", device[:max_mem_alloc_size] / 1024^2)
        @printf("Device max clock freq: %i MHZ\n",  device[:max_clock_frequency])
        @printf("Device max compute units: %i\n",   device[:max_compute_units])
        @printf("Device max work group size: %i\n", device[:max_work_group_size])
        @printf("Device max work item size: %s\n",  device[:max_work_item_size])
        @printf("Device max work dimension size: %s\n",  device[:max_work_item_dims])
   end
end
