# Building on Windows
This process is tedious as hell, but it's possible to do that.

## Requirements
- [MSYS2](https://www.msys2.org/)
- [FPC x86_64](https://sourceforge.net/projects/freepascal/files/Win32/3.2.2/fpc-3.2.2.i386-win32.cross.x86_64-win64.exe/download) if building on x86_64; otherwise, choose the appropriate FPC version.
- Internet connection during the first build (to install more packages).

## Manual Process
- Run the `MSYS2 MINGW64` environment. SPECIFICALLY MINGW64! All instructions below will be for MINGW64. If you wish to do 32-bit compilation, use MINGW32 and correct all scripts and choose corrent msys environment, but this is not tested.
- Set the environment variable `FPC_COMPILER` to be the full path to the FPC executable, depending on your installation location.
- `cd` into the root of this repository. Run the `./scripts/build_msys.sh` script to start the build process and install all packages.
  - The script checks if there is a `build` directory in the repo, and only then installs packages. Make sure to not have such a directory for your first build.
  - Although the official GTK wiki suggests using the UCRT environment, it seems to work awfully bad for our case!
  - You can see and modify this script as you wish. We use MinGW makefiles as output for the CMake as well.
- After a successful build, run `./scripts/run_msys.sh`. It sets the correct terminal encoding and runs hiasm5.exe.
- You have the `_base` package working! :D As well as builded FTCG/RTCG codegens + WEB package