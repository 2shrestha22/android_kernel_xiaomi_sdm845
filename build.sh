#!/bin/bash
export ARCH=arm64
export PATH="$PATH:$HOME/toolchains/proton-clang/bin"

K_CROSS_COMPILE=aarch64-linux-gnu-
K_CROSS_COMPILE_ARM32=arm-linux-gnuabi-

# prepare config file
cat arch/arm64/configs/vendor/xiaomi/mi845_defconfig arch/arm64/configs/vendor/xiaomi/beryllium.config > arch/arm64/configs/beryllium_defconfig

# Clean previous output (optional)
make O=out clean

# Setup defconfig (replace with your defconfig file)
make O=out beryllium_defconfig

# Build the kernel
make -j$(nproc) O=out \
    CC=clang \
    CROSS_COMPILE=$K_CROSS_COMPILE \
    CROSS_COMPILE_ARM32=$K_CROSS_COMPILE_ARM32
