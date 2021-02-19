.SUFFIXES:
.DEFAULT_GOAL := all

GUARD=@mkdir -p $(@D)

CC?=gcc

TARGET_CC?=arm-none-eabi-gcc
TARGET_LD?=arm-none-eabi-ld

SRCDIR=$(shell pwd)/src
TOOLDIR=$(shell pwd)/tools
BINDIR=$(shell pwd)/bin

WARNINGS= \
	-Wall \
	-Wextra \
	-Werror

INCLUDES= \
	-Isrc/

TARGET = \
	-march=armv6-m \
	-mcpu=cortex-m0plus \
	-mthumb

include $(wildcard $(TOOLDIR)/.build.mk)
include $(wildcard src/*/.build.mk)

.PHONY: all
all: $(KERNEL_BIN)

.PHONY: menuconfig
menuconfig:
	$(CONF) --menuconfig

.PHONY: defconfig
defconfig:
	$(CONF) --defconfig

.PHONY: book
book:
	mdbook build -o

.PHONY: clean
clean:
	rm -rf bin
	rm -rf book

-include $(shell find bin/ -name '*.d')
