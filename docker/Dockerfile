FROM debian:bullseye
# Get dependencies
RUN apt update
RUN apt install -y nasm
RUN apt install -y grub-pc-bin
RUN apt install -y grub-common
RUN apt install -y wget tar
RUN apt install -y git build-essential bison flex libgmp3-dev libmpc-dev libmpfr-dev texinfo

# Get binutils Source Code
WORKDIR /root/build-tools

RUN wget https://ftp.gnu.org/gnu/binutils/binutils-2.36.tar.xz 
RUN tar -xf binutils-2.36.tar.xz

# Compile binutils Source Code
WORKDIR /root/build-tools/binutils-2.36
RUN ./configure --target=x86_64-elf --prefix=/root/build-tools/target --with-sysroot --disable-werror --disable-nls
RUN make
RUN make install

# Get GCC Source Code
WORKDIR /root/build-tools

RUN wget http://ftp.tsukuba.wide.ad.jp/software/gcc/releases/gcc-11.1.0/gcc-11.1.0.tar.xz 
RUN tar -xf gcc-11.1.0.tar.xz
RUN mkdir gcc
WORKDIR /root/build-tools/gcc

# Compile GCC Source Code
RUN /root/build-tools/gcc-11.1.0/configure --target=x86_64-elf --prefix=/root/build-tools/target --disable-nls --enable-languages=c,c++,go --without-headers
RUN make all-gcc
RUN make all-target-libgcc
RUN make install-gcc
RUN make install-target-libgcc

# Install xorriso
RUN apt install -y xorriso
RUN export PATH=$PATH:/root/env/build-tools/target/bin/

# Setup Volume
VOLUME [ "/root/env" ]

WORKDIR /root/env

# Default command
CMD ["/bin/bash"]