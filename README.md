# RISC-V 32-bit Linux From Scratch

RISC-V has a growing following with an increasing number of commercial vendors of RISC-V compliant cores, as well as many open-source implementations.  
RISC-V has had a Linux port for a while, however only the 64-bit variant of RISC-V is well supported.

Whilst the 64-bit variant has [distro](https://wiki.debian.org/RISC-V) support, the 32-bit target is somewhat unloved and it can be harder to build a working kernel for it.  
There are build systems such as [Yocto](https://www.yoctoproject.org/) which enable complete Linux distributions for embedded systems to built.

This isn't that - this is a minimal GCC + Linux Kernel + Busybox build flow targetting RISC-V 32-bit (RV32IMA).

## Getting Started

#### 0. Build system deps
```
# Ubuntu
sudo apt-get install autoconf automake autotools-dev curl python3 libmpc-dev libmpfr-dev libgmp-dev gawk build-essential bison flex texinfo gperf libtool patchutils bc zlib1g-dev libexpat-dev git libncurses-dev openssl libssl-dev dkms libelf-dev libudev-dev libpci-dev libiberty-dev
```

#### 1. Cloning

To clone this repo;
```
git clone https://github.com/ultraembedded/riscv32_linux_from_scratch.git
```

#### 2. Acquire external source
```
# Clone Busybox
make clone_busybox

# Clone Linux Kernel and checkout known working release for RV32
make clone_kernel
```

#### 3. Clone and build toolchains

Skip this if you already have *riscv32-unknown-elf-gcc* and *riscv32-unknown-linux-gnu-gcc* already built;
```
# Clone toolchain repositories
make clone_toolchain

# Build riscv32-unknown-elf-gcc for RV32IM
make build_gcc_newlib

# Build riscv32-unknown-linux-gnu-gcc for RV32IMA
make build_gcc_linux

# This results in ./toolchain/riscv32im and ./toolchain/riscv32ima-linux being created after a long wait...
```
