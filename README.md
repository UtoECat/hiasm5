![ScreenShot](http://i.mcgl.ru/KfOVAZ8ni3)

HiAsm 5 - desktop IDE to create programs with a graphical programming

http://hiasm.com

## this fork

this repository contains everything in one place to build hiasm 5 and use the WEB and _base packages without having to install any third party .deb packages.

- Updated FTCG source codes for compilation with the modern FPC compiler.
- The resource directory in Linux is located in the same way as in Windows or MAC OS.
- Only Linux has been verified to build successfully.

## how to build
1. install ```gtksourceviewmm-3.0-dev gtkmm-2.4-dev libsqlite3-dev md5deep fpc```
  1. on Debian/Ubuntu don't forget to set corrent PKG_CONFIG_PATH
2. run ```make```
3. Ready...?
