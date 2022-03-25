# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2022-present 351ELEC (https://github.com/351ELEC)

PKG_NAME="same_cdi"
PKG_VERSION="dcc76a5b6d3fb5da9ca29209e1a66bbc1396f83a"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/libretro/same_cdi"
PKG_URL="$PKG_SITE.git"
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="libretro"
PKG_SHORTDESC="SAME_CDI is a Single Arcade/Machine Emulator for libretro"
PKG_LONGDESC="SAME_CDI is a Single Arcade/Machine Emulator for libretro"
PKG_TOOLCHAIN="make"
PKG_BUILD_FLAGS="-lto"

PKG_MAKE_OPTS_TARGET="REGENIE=1 \
                      VERBOSE=1 \
                      NOWERROR=1 \
                      OPENMP=1 \
                      CROSS_BUILD=1 \
                      TOOLS=0 \
                      RETRO=1 \
                      PTR64=0 \
                      NOASM=0 \
                      PYTHON_EXECUTABLE=python3 \
                      CONFIG=libretro \
                      LIBRETRO_OS=unix \
                      LIBRETRO_CPU= \
                      PLATFORM=arm64 \
                      ARCH= \
                      TARGET=mame \
                      OSD=retro \
                      USE_SYSTEM_LIB_EXPAT=1 \
                      USE_SYSTEM_LIB_ZLIB=1 \
                      USE_SYSTEM_LIB_FLAC=1 \
                      USE_SYSTEM_LIB_SQLITE3=1"

pre_configure_target() {
  sed -i "s/-static-libstdc++//g" scripts/genie.lua
}

make_target() {
  unset ARCH
  unset DISTRO
  unset PROJECT
  export ARCHOPTS="-D__aarch64__ -DASMJIT_BUILD_X86"
  make -f Makefile.libretro $PKG_MAKE_OPTS_TARGET OVERRIDE_CC=$CC OVERRIDE_CXX=$CXX OVERRIDE_LD=$LD AR=$AR $MAKEFLAGS
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp same_cdi_libretro.so $INSTALL/usr/lib/libretro/
}