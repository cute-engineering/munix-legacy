.SUFFIXES:
.DEFAULT_GOAL := all

GUARD=@mkdir -p $(@D)

CC?=gcc

TARGET_CC?=arm-none-eabi-gcc
TARGET_LD?=arm-none-eabi-ld

MCONF=kconfig-mconf
CONF=kconfig-conf

SRCDIR=$(shell pwd)/src
BINDIR=$(shell pwd)/bin

WARNINGS= \
	-Wall \
	-Wextra \
	-Werror

INCLUDES= \
	-Isrc/
	-Iinclude/

TARGET = \
	-march=armv6-m \
	-mcpu=cortex-m0plus \
	-mthumb

include $(wildcard src/*/.build.mk)

.PHONY: all
all: $(KERNEL_BIN)

.PHONY: menuconfig
menuconfig:
	$(MCONF) Kconfig

.PHONY: config
config:
	mkdir -p include/
	mkdir -p include/config include/generated
	$(CONF) --silentoldconfig Kconfig

.PHONY: book
book:
	mdbook build -o

.PHONY: clean
clean:
	rm -rf bin
	rm -rf book

-include $(shell find bin/ -name '*.d')
