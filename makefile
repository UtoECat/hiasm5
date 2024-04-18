all:
	cd src && make -j4
	cd runnersrc && make -j4
	cd FTCG && ./make.sh
	cd RTCG && make -j4
