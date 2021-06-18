# doodleOS

## Building the Operating System
### Get required build-tools
#### From Dockerhub
```
docker pull panzerox123/gcc-cross-x86_64-elf:gccgo11
```
#### Building from Dockerfile
```
docker build docker/ -t <imagename>:<tag>
```
### Building the OS
1. Start a container
```
docker run --rm -it panzerox123/gcc-cross-x86_64-elf:gccgo11
```
2. Run `make` to build binary
3. run `make qemu_bootable` to build bootable ISO for Qemu/VirtualBox