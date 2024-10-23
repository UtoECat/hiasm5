# linux-only makefile!! for windows use msys2 and cmake! see scripts folder for ready to use scripts!

all:
	cd src && make -j4
	cd runnersrc && make -j4
	cd elements/FTCG && ./make.sh
	cd elements/RTCG && make -j4
	cd elements/web && make
