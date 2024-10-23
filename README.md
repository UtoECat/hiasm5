![ScreenShot](http://i.mcgl.ru/KfOVAZ8ni3)

HiAsm 5 - Desktop IDE to create programs with graphical programming.

http://hiasm.com

## This Fork

This repository contains everything in one place to build HiAsm 5 and use the WEB and _base packages without having to install any third-party .deb packages.

- Updated FTCG source codes for compilation with the modern FPC compiler.
- The resource directory in Linux is located in the same way as in Windows or macOS.
- Only Linux and Windows have been verified to build successfully.
- Uses CMake build system + a small amount of bash scripts.

## How to Build
- Windows (MSYS2): [click](docs/build_windows.md)
- Linux/UNIX: [click](docs/build-unix_and_linux.md)