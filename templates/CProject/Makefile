# Compiler
CC = gcc

# Compiler flags
CFLAGS = -Wall -Iinclude

# Source files
SRCS = src/main.c src/utils.c

# Object files
OBJS = $(SRCS:.c=.o)

# Executable name
TARGET = myapp

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJS)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJS) $(TARGET)

.PHONY: all clean