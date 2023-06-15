CC = g++ 
CFLAGS = -std=c++11 -pedantic-errors -Wall -Wextra -lpthread 
CPPFLAGS = -I 
FOLDER = -I include 

SOURSES = test/test_light.cpp src/ThreadPool.cpp src/WorkerThread.cpp src/ThreadMap.cpp 

SOURSES_2 = test/test_hard.cpp src/ThreadPool.cpp src/WorkerThread.cpp src/ThreadMap.cpp 

EXECUTABLE = light_test
EXECUTABLE_2 = hard_test

.PHONY : all, debug, release, clean

all:$(EXECUTABLE) $(EXECUTABLE_2)

debug: CFLAGS += -g
debug: $(EXECUTABLE)

release: CFLAGS += -DNDEBUG -O3
release: $(EXECUTABLE)

$(EXECUTABLE): $(SOURSES)
	$(CC)  $(SOURSES)  $(FOLDER) $(CFLAGS) -o light_test

$(EXECUTABLE_2): $(SOURSES_2)
	$(CC)  $(SOURSES_2)  $(FOLDER) $(CFLAGS) -o hard_test
		
clean:
	rm *.out
	
	



