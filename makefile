.PHONY: all
all: task1  task2 task3

task1: main1_1.c hello_ariel.c hello_ariel.h
	gcc -o main1_1 hello_ariel.c main1_1.c

task2: main1_2.c hello_ariel.h lib
	gcc main1_2.c -L. -l Hello -o main1_2

task3: main1_3.c lib
	gcc main1_3.c -fPIC -ldl -o main1_3

lib: hello_ariel.c hello_ariel.h
	gcc -shared hello_ariel.c -fPIC -o libHello.so 


.PHONY: clean
clean: 
	-rm main1_1 main1_2 main1_3 libHello.so
