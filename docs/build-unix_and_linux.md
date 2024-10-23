# Building on UNIXes
It's pretty easy.

## Install Packages
- Ubuntu/Debian: `gtksourceviewmm-3.0-dev gtkmm-2.4-dev libsqlite3-dev md5deep fpc cmake make gcc`
- Arch/Manjaro: `gtksourceviewmm gtkmm gtkmm3 sqlite3 md5deep fpc cmake make gcc`

## Build Using CMake
- `mkdir build`
- `cd build`
- `cmake .. && make -j2`
- It's done, run `./hiasm`