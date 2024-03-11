# Directories
SRC = src
BUILD = build
INCLUDE = include
LIB = lib

ALL_INCLUDES = -I./$(LIB) -I./$(INCLUDE) -I./$(STB_IMAGE)
STB_IMAGE = $(LIB)/stb_image

# Compiler and flags
CC = gcc
CXX = g++
CFLAGS = -Wall -O2 -g $(ALL_INCLUDES)
CXXFLAGS = -std=c++20 -O2 -Wall -Wextra -pedantic -g -D_GLIBCXX_DEBUG $(ALL_INCLUDES)
LDFLAGS = -lglfw -lvulkan -ldl -lpthread -lX11 -lXxf86vm -lXrandr -lXi

# Shared objects by multiple executables
CPP_FILES := VulkanApplication.cpp MyWindow.cpp
OBJECTS := $(CPP_FILES:.cpp=.o) stb_image.o
OBJECTS := $(addprefix $(BUILD)/, $(OBJECTS))

# Targets
CPP_EXEC := vulkan_test.cpp
TARGETS_OBJ := $(CPP_EXEC:%.cpp=$(BUILD)/%.o)
TARGETS := $(TARGETS_OBJ:%.o=%)

# Recipes
all: $(TARGETS)

$(TARGETS): $(OBJECTS)

# Link
.SECONDEXPANSION:
$(TARGETS): $(OBJECTS) $$@.o
	$(CXX) -o $@ $^ $(LDFLAGS)

# Compile objects

# stb_image:
$(BUILD)/stb_image.o: $(STB_IMAGE)/stb_image.cpp $(STB_IMAGE)/stb_image.h | $(BUILD)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# cpp files with header files
$(BUILD)/%.o: $(SRC)/%.cpp $(INCLUDE)/%.h | $(BUILD)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# cpp files without header files
$(BUILD)/%.o: $(SRC)/%.cpp | $(BUILD)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# PHONY
.PHONY: all clean run

clean:
	rm -rf $(BUILD)

run: $(TARGETS)
	./$(BUILD)/vulkan_test

$(BUILD):
	mkdir -p $(BUILD)