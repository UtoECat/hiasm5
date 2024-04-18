all:
	cd src && make
	cd .. 
	cd runnersrc
	./create-links.sh
	cd ..
	cd FTCG
	./make.sh
	cd ..
	cd RTCG
	make
	cd ..
