RV_LFS_ROOT := $(CURDIR)

#############################################################################
# Rules
#############################################################################
TARGET_HELP+= "Help:\n"
all: help

#############################################################################
# clone_busybox
#############################################################################
TARGET_HELP += "make clone_busybox         - Fetch Busybox source.\n"
clone_busybox:
	git clone git://busybox.net/busybox.git

#############################################################################
# clone_kernel
#############################################################################
TARGET_HELP += "make clone_kernel          - Fetch Linux Kernel source.\n"
clone_kernel:
	git clone https://github.com/torvalds/linux.git && \
	cd linux && \
	git checkout v5.0-rc8

#############################################################################
# clone_toolchain
#############################################################################
TARGET_HELP += "make clone_toolchain       - Fetch RISC-V toolchain source.\n"
clone_toolchain:
	git clone --recursive https://github.com/riscv/riscv-gnu-toolchain

#############################################################################
# build_gcc_newlib
#############################################################################
TARGET_HELP += "make build_gcc_newlib      - Build newlib RISC-V GCC and install to $(RV_LFS_ROOT)/toolchain/riscv32im.\n"
build_gcc_newlib:
	rm -rf $(RV_LFS_ROOT)/build/build-riscv32im && \
	mkdir -p $(RV_LFS_ROOT)/build/build-riscv32im && \
	cd $(RV_LFS_ROOT)/build/build-riscv32im && \
	$(RV_LFS_ROOT)/riscv-gnu-toolchain/configure --with-arch=rv32im --prefix=$(RV_LFS_ROOT)/toolchain/riscv32im && \
	make -j

#############################################################################
# build_gcc_linux
#############################################################################
TARGET_HELP += "make build_gcc_linux       - Build linux RISC-V GCC and install to $(RV_LFS_ROOT)/toolchain/riscv32ima-linux.\n"
build_gcc_linux:
	rm -rf $(RV_LFS_ROOT)/build/build-riscv32ima-linux && \
	mkdir -p $(RV_LFS_ROOT)/build/build-riscv32ima-linux && \
	cd $(RV_LFS_ROOT)/build/build-riscv32ima-linux && \
	$(RV_LFS_ROOT)/riscv-gnu-toolchain/configure --with-arch=rv32ima --prefix=$(RV_LFS_ROOT)/toolchain/riscv32ima-linux && \
	make -j linux

#############################################################################
# help
#############################################################################
help:
	@echo $(TARGET_HELP)
