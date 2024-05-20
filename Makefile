CC = clang
CFLAGS = -Wall -Wextra -Werror -Wno-newline-eof -Wno-unused-parameter -Wno-strict-prototypes -pedantic -std=c11 -ferror-limit=1
LDFLAGS = -lm

PROGRAM = program
SOURCE_FILES = $(wildcard *.c)
HEADER_FILES = $(wildcard *.h)
OBJECT_FILES = $(SOURCE_FILES:.c=.o)

.PHONY: all build clean run

all: build

build: $(PROGRAM)

clean:
	rm -f $(PROGRAM) $(OBJECT_FILES)

run: build
	./$(PROGRAM)

$(PROGRAM): $(OBJECT_FILES)
	$(CC) -o $@ $^ $(LDFLAGS)