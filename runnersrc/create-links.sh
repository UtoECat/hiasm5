#!/bin/sh

for i in Data ElementConfig Element ElementGrips ElementPoint ElementProperty Elements MainDataBase Pack Compiler SDK SelectManager share StringList settings
do
  echo "$i"
	ln -s ../src/$i.cpp $i.cpp
	ln -s ../src/$i.h $i.h
done
