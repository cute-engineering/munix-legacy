ARCHCFLAGS := \
	-march=armv6-m \
	-mcpu=cortex-m0plus \
	-mthumb

ARCHLDFLAGS := \
		-T $(SRCDIR)/arch/$(CONFIG_TARGET_ARCH)/$(CONFIG_TARGET_SOC)/link.ld


KERNEL_UF2=$(BINDIR)/kernel.uf2
TARGET=$(KERNEL_UF2)

$(KERNEL_UF2): $(KERNEL_ELF) $(ELF2UF2)
	$(GUARD)
	$(ELF2UF2) $< $@