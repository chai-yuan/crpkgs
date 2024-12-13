# 构建配置
PROJECT_NAME = cproject
SRCS_DIR = src
HEADS_DIR = include

CC = gcc
CFLAGS = -Wall -Werror -I$(HEADS_DIR)
LDFLAGS =

ifeq ($(PLATFORM), debug)
    CFLAGS += -g -DDEBUG
else ifeq ($(PLATFORM), release)
    CFLAGS += -O2
else
    CFLAGS += -O2
endif

# 构建命令
SRCS = $(shell find $(SRCS_DIR) -name '*.c') 
OBJS = $(patsubst $(SRCS_DIR)/%.c, build/%.o, $(SRCS))
HEADS = $(shell find $(HEADS_DIR) -name '*.h') 

$(PROJECT_NAME): $(OBJS)
	@echo "[LINK] Linking final executable: $@"
	@$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)

$(OBJS): build/%.o : src/%.c $(HEADS)
	@echo "[CC] Compiling $< -> $@"
	@mkdir -p $(dir $@)  
	@$(CC) $(CFLAGS) -c $< -o $@

run: $(PROJECT_NAME)
	@echo "[RUN] Running the program: ./$(PROJECT_NAME)"
	@./$(PROJECT_NAME)

clean:
	@echo "[CLEAN] Cleaning up build artifacts"
	@rm -f $(PROJECT_NAME) $(OBJS)

.PHONY: clean run
