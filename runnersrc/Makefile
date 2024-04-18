CC = g++

CPPFLAGS = -Wall -c -O1 -g $(shell pkg-config gtksourceviewmm-3.0 --cflags) -fpic
LDLIBS = $(shell pkg-config gtksourceviewmm-3.0 --libs) -lsqlite3 -lpthread $(shell pkg-config gmodule-2.0 --libs)

SOURCES = $(wildcard *.cpp) 
APP = ../runner

all: $(APP)

clean:
	rm $(APP) *.o

$(APP): $(SOURCES:%.cpp=%.o)
	$(CXX) $^ $(LDLIBS) -o $(APP) 

