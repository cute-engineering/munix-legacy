KCFLAGS= \
	-MD \
	$(WARNINGS) \
	$(INCLUDES) \
	$(TARGET)

KLDFLAGS= \
	-T $(SRCDIR)/kernel/link.ld

KERNEL_BIN=$(BINDIR)/kernel.elf
KERNEL_SRC=$(wildcard $(SRCDIR)/kernel/*.c $(SRCDIR)/kernel/*.s)
KERNEL_OBJ=$(patsubst $(SRCDIR)/%, $(BINDIR)/%.o, $(KERNEL_SRC))

$(BINDIR)/%.c.o: $(SRCDIR)/%.c $(CONFIG_HEADER)
	$(GUARD)
	$(TARGET_CC) $(KCFLAGS) -c -o $@ $<

$(BINDIR)/%.s.o: $(SRCDIR)/%.s $(CONFIG_HEADER)
	$(GUARD)
	$(TARGET_CC) $(KCFLAGS) -c -o $@ $<

$(KERNEL_BIN): $(KERNEL_OBJ) $(SRCDIR)/kernel/link.ld
	$(GUARD)
	$(TARGET_LD) $(KLDFLAGS) -o $@ $(KERNEL_OBJ)
