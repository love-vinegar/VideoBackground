CC = g++
CFLAGS = -std=c++11
OPENCV_FLAGS = `pkg-config --cflags --libs opencv`

SRCDIR = src
BINDIR = bin

SOURCES := $(wildcard $(SRCDIR)/*.cpp)
OBJECTS := $(SOURCES:$(SRCDIR)/%.cpp=$(BINDIR)/%.o)
EXECUTABLE := $(BINDIR)/main

all: $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	$(CC) $(CFLAGS) $^ -o $@ $(OPENCV_FLAGS) 

$(BINDIR)/%.o: $(SRCDIR)/%.cpp | $(BINDIR)
	$(CC) $(CFLAGS) -c $< -o $@ $(OPENCV_FLAGS)

$(BINDIR):
	mkdir -p $(BINDIR)

run: $(EXECUTABLE)
	./$(EXECUTABLE)

clean:
	rm -rf $(BINDIR)

