PKG_NAME="a5200"
PKG_VERSION="7eee43299d0abe28828dee2b86f100b066391866"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/libretro/a5200"
PKG_URL="$PKG_SITE.git"
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="libretro"
PKG_SHORTDESC="arduous for libretro"
PKG_LONGDESC="arduous for libretro/"

PKG_IS_ADDON="no"
PKG_TOOLCHAIN="make"
PKG_AUTORECONF="no"

#pre_configure_target() {
  #export CXXFLAGS="$CXXFLAGS -Wno-error=maybe-uninitialized"
#}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp a5200_libretro.so $INSTALL/usr/lib/libretro/
}