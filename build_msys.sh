#!/bin/sh
# THIS SCRIPT uses msys2 enviroment with mingw to build this app

export PKG_CONFIG_PATH=/mingw64/lib/pkgconfig
PLATFORM_PREFIX="mingw-w64-x86_64-"

if [ ! -d "./build" ]; then
  echo "$./build/ directory does not exist. installing packages and stuff"
  pacman -S "${PLATFORM_PREFIX}gtksourceviewmm3" "${PLATFORM_PREFIX}gdk-pixbuf2" "${PLATFORM_PREFIX}sqlite3" "${PLATFORM_PREFIX}gtkmm" --noconfirm
  pacman -S "${PLATFORM_PREFIX}cmake" "${PLATFORM_PREFIX}make" "${PLATFORM_PREFIX}gcc" "${PLATFORM_PREFIX}binutils" --noconfirm
  mkdir build
fi

cd build || { echo "build directory creation failed!"; exit -1; }

cmake.exe .. -G "MSYS Makefiles"
make.exe
