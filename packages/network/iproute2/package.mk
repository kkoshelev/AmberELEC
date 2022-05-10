# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2022 Konstantin Koshelev (kk@mavhs.net)

PKG_NAME="iproute2"
PKG_VERSION="5.17.0"
PKG_SHA256="ab5ed83d901d42a8dd5ec539ab8de35c65f921f002331fc7adfd359def33158d"
PKG_LICENSE="GPL"
PKG_SITE="https://wiki.linuxfoundation.org/networking/iproute2"
PKG_URL="https://github.com/shemminger/iproute2/archive/refs/tags/v$PKG_VERSION.tar.gz"
#PKG_DEPENDS_TARGET="toolchain linux libmnl libnftnl"
PKG_DEPENDS_TARGET="toolchain linux iptables"
PKG_LONGDESC="Iproute2 is a collection of utilities for controlling TCP / IP networking and traffic control."
PKG_TOOLCHAIN="make"

PKG_CONFIGURE_OPTS_TARGET="--with-kernel=$(kernel_path)
                           CPPFLAGS=-I${SYSROOT_PREFIX}/usr/include"

#pre_configure_target() {
  # add extra flag to toolchain default
  #CFLAGS="$CFLAGS -DEXTRA_FLAG=yeah"
  KERNEL_INCLUDE=$(kernel_path)
#}

make_target() {
#  cd $PKG_BUILD
#  make all V=1
#  make CC="$HOST_CC" \
#       CPPFLAGS="$HOST_CPPFLAGS" \
#       CFLAGS="$HOST_CFLAGS" \
#       LDFLAGS="$HOST_LDFLAGS" \
#       -C $PKG_BUILD V=1
  KERNEL_INCLUDE=$(kernel_path)
  make CC="$CC" LD="$LD" HOSTCC="$HOST_CC" -C $PKG_BUILD V=1 config.mk
  make CC="$CC" LD="$LD" HOSTCC="$HOST_CC" -C $PKG_BUILD/ip V=1
}


#post_makeinstall_target() {
#  mkdir -p $INSTALL/usr/config/iptables/
#    cp -PR $PKG_DIR/config/README $INSTALL/usr/config/iptables/

#  mkdir -p $INSTALL/etc/iptables/
#    cp -PR $PKG_DIR/config/* $INSTALL/etc/iptables/

#  mkdir -p $INSTALL/usr/lib/coreelec
#    cp $PKG_DIR/scripts/iptables_helper $INSTALL/usr/lib/coreelec
#}

#post_install() {
#  enable_service iptables.service
#}

