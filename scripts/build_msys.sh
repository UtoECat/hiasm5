#!/bin/sh
# THIS SCRIPT uses msys2 enviroment with mingw to build this app

# cd to root of repository
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd $SCRIPT_DIR/../

export PKG_CONFIG_PATH=/mingw64/lib/pkgconfig
# NOTICE: we use MINGW64! NOT SUGGESTED BY gtk docs ucrt! UCRT IS BROKEN AS HELL!!
# If hiasm does not work after startup : run `chcp.com 65001` ! (or use runn_msys.sh script)
PLATFORM_PREFIX="mingw-w64-x86_64-"

if [ ! -d "./build" ]; then
  echo "$./build/ directory does not exist. installing packages and stuff"
  pacman -S "${PLATFORM_PREFIX}gtksourceviewmm3" "${PLATFORM_PREFIX}gdk-pixbuf2" "${PLATFORM_PREFIX}sqlite3" "${PLATFORM_PREFIX}gtkmm" "${PLATFORM_PREFIX}gtk3" "${PLATFORM_PREFIX}glibmm" --noconfirm
  pacman -S "${PLATFORM_PREFIX}cmake" "${PLATFORM_PREFIX}make" "${PLATFORM_PREFIX}gcc" "${PLATFORM_PREFIX}binutils" --noconfirm
  mkdir build
fi

cd build || { echo "build directory creation failed!"; exit -1; }

cmake.exe .. -G "MinGW Makefiles"
mingw32-make.exe

# not needed anymore - handled my cmake itself!
# cp ./build/hiasm5.exe ./hiasm5.exe
# cp ./build/runner.exe ./runner.exe