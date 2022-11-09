# nvidia-driver

This is a project for creating a gpu driver used by the NVIDIA gpu operator.

## Build

### Prerequisite

- Linux
- docker >= 20.10.12

### GPU driver and cuda version 

```bash
# export DRIVER_VERSION="151.48.07"
# export CUDA_VERSION="11.7.0"
```

### image build

```bash
# make build
```

## References
- [NVIDIA container-images driver](https://gitlab.com/nvidia/container-images/driver)
- [NVIDIA driver archive](https://www.nvidia.com/en-us/driver/unix/linux-amd64-display-archive/)
- [GPU operator component matrix](https://docs.nvidia.com/datacenter/cloud-native/gpu-operator/platform-support.html#gpu-operator-component-matrix)
