# building on windows
This process is tedious as hell, but it's possible to do that.
## Requirements
- [MSYS2]()
- [FPC x86_64]() if building on x86_64, otherwise choose approperative FPC version
- Internet connection during first boot (to install more packages)
## Manual Process
- Run `MSYS2 MINGW64` enviroment. SPECIFICALLY MINGW64! All instructions below will be for mingw64. If ou wish doing 32bit compilation - use mingw32 and correct all scripts and enviroments, but this is not supported and not tested.
- `cd` into the root of this repository. Run `./build_msys.sh` script to start build process and install all packages.
  - Script checks if there is a `build` directory in repo, and only then installs packages. Make sure to not have such directory for your first build.
  - Although official gtk wiki suggests using ucrt enviroment - it seems to work awfully bad for our case!
  - You can see and modify this script as you wish. We use mingw makefiles as output for the cmake as well.
- After succesful build, run `./run_msys.sh`. It sets corrent termainal encoding and runs hiasm5.exe
- You have `_base` package working! :D But that's not enough....
- Now we need to set enviroment variabnle FPC_COMPILER to exe of fpc compiler! `FPC_COMPILER+/c/FPC/`

## Building FTCG
To be able to use FTCG-based packages (includes web package) you need to build approperate Codegen shared library.
Unfortunately, this one REQUIRES FPC compiler.
