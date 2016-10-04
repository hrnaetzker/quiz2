
build: create 

all: build clean

create: collegemain.o college.o course.o
	g++ collegemain.o college.o course.o -o create

course.o: course.h course.cc 
	g++ -c course.cc

college.o: college.h college.cc
	g++ -c college.cc

collegemain.o: collegemain.cc course.h college.h node.h
	g++ -c collegemain.cc

clean:
	-rm -f *.o 

archive: 
	tar cvf ../MyTar.tar *.cc
	
myexe: build

doc: html/index.hmtl

html/index.html: wc.c
	doxygen -g wc.c
	
doczip: doc.tgz

doc.tgz: html/index.html
	tar cvzf doc.tgx html