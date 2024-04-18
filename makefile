all:
	cd src && make -j4
	cd runnersrc && make -j4
	cd elements/FTCG && ./make.sh
	cd elements/RTCG && make -j4
	cd elements/web && make
