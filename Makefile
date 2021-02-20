.SUFFIXES:
.DEFAULT_GOAL := all

-include .config.mk

GUARD=@mkdir -p $(@D)

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

CC?=gcc
CXX?=g++

CFLAGS += $(INCLUDES)
CXXFLAGS += $(INCLUDES)

TARGET_CC?=arm-none-eabi-gcc
TARGET_LD?=arm-none-eabi-ld

SRCDIR=$(shell pwd)/src
TOOLDIR=$(shell pwd)/tools
BINDIR=$(shell pwd)/bin

include $(wildcard $(TOOLDIR)/.build.mk)

.PHONY: menuconfig
menuconfig:
	$(CONF) --menuconfig
	$(CONF) --genmake .config.mk

.PHONY: defconfig
defconfig:
	$(CONF) --defconfig
	$(CONF) --genmake .config.mk

ifeq (, $(wildcard ./.config))

.PHONY: all
all:
	@echo "Looks wike someone didn't wead the buiwd guide smh wU"
	@echo "You need to wun 'make menuconfig' ow 'make defconfig' fiwst ÒwÓ"

else

include $(wildcard src/*/.build.mk)

.PHONY: all
all: $(KERNEL_UF2)

-include $(shell find bin/ -name '*.d')

endif

.PHONY: book
book:
	mdbook build -o

.PHONY: clean
clean:
	rm -rf bin
	rm -rf book

.PHONY: distclean
distclean: clean
	rm .config
	rm .config.mk
