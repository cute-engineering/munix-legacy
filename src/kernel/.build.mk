KCFLAGS= \
	-MD \
	$(WARNINGS) \
	$(INCLUDES) \
	$(TARGET)

KLDFLAGS= \
	-T $(SRCDIR)/kernel/link.ld

KERNEL_ELF=$(BINDIR)/kernel.elf
KERNEL_UF2=$(BINDIR)/kernel.uf2
KERNEL_SRC=$(wildcard $(SRCDIR)/kernel/*.c $(SRCDIR)/kernel/*.s)
KERNEL_OBJ=$(patsubst $(SRCDIR)/%, $(BINDIR)/%.o, $(KERNEL_SRC))

$(BINDIR)/%.c.o: $(SRCDIR)/%.c $(CONFIG_HEADER)
	$(GUARD)
	$(TARGET_CC) $(KCFLAGS) -c -o $@ $<

$(BINDIR)/%.s.o: $(SRCDIR)/%.s $(CONFIG_HEADER)
	$(GUARD)
	$(TARGET_CC) $(KCFLAGS) -c -o $@ $<

$(KERNEL_ELF): $(KERNEL_OBJ) $(SRCDIR)/kernel/link.ld
	$(GUARD)
	$(TARGET_LD) $(KLDFLAGS) -o $@ $(KERNEL_OBJ)

$(KERNEL_UF2): $(KERNEL_ELF) $(ELF2UF2)
	$(GUARD)
	$(ELF2UF2) $< $@