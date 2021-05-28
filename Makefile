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

CC?=gcc
CXX?=g++

CFLAGS += $(INCLUDES)
CXXFLAGS += $(INCLUDES)

TARGET_CC?=$(CONFIG_TARGET_CC)
TARGET_AS?=$(CONFIG_TARGET_AS)
TARGET_LD?=$(CONFIG_TARGET_LD)

SRCDIR=$(shell pwd)/src
TOOLDIR=$(shell pwd)/tools
BINDIR=$(shell pwd)/bin/$(CONFIG_TARGET_ARCH)/$(or $(CONFIG_TARGET_BOARD), default)

KERNEL_ELF=$(BINDIR)/kernel.elf

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

-include $(shell echo src/arch/$(CONFIG_TARGET_ARCH)/.build.mk) # it's a bit hacky but yunno it's work
-include $(shell echo src/arch/$(CONFIG_TARGET_ARCH)/$(CONFIG_TARGET_SOC)/.build.mk)

ARCH_SRC=$(wildcard src/arch/$(CONFIG_TARGET_ARCH)/*.c src/arch/$(CONFIG_TARGET_ARCH)/*.s) \
		$(wildcard src/arch/$(CONFIG_TARGET_ARCH)/$(CONFIG_TARGET_SOC)/*.c src/arch/$(CONFIG_TARGET_ARCH)/$(CONFIG_TARGET_SOC)/*.s)


include $(wildcard src/*/.build.mk)

TARGET ?= $(KERNEL_ELF)

.PHONY: all
all: $(TARGET)

-include $(shell find bin/ -name '*.d')

endif

.PHONY: book
book:
	mdbook build -o

.PHONY: clean
clean:
	rm -rf $(BINDIR)
	rm -rf book

.PHONY: distclean
distclean: clean
	rm .config
	rm .config.mk
