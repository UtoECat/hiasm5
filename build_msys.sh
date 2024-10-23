#!/bin/sh
# THIS SCRIPT uses msys2 enviroment with mingw to build this app

export PKG_CONFIG_PATH=/mingw64/lib/pkgconfig
PLATFORM_PREFIX="mingw-w64-x86_64-"
pacman -S "${PLATFORM_PREFIX}gtksourceviewmm3" "${PLATFORM_PREFIX}gdk-pixbuf2" "${PLATFORM_PREFIX}sqlite3" "${PLATFORM_PREFIX}gtkmm" "${PLATFORM_PREFIX}cmake" "${PLATFORM_PREFIX}make"

mkdir build
cd build

cmake.exe ..
make.exe
