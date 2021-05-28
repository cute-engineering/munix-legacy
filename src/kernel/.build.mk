KCFLAGS= \
	-MD \
	$(WARNINGS) \
	$(INCLUDES) \
	$(ARCHCFLAGS)

KLDFLAGS= \
	$(ARCHLDFLAGS)

KERNEL_SRC=$(wildcard $(SRCDIR)/kernel/*.c) $(ARCH_SRC)
KERNEL_OBJ=$(patsubst $(SRCDIR)/%, $(BINDIR)/%.o, $(KERNEL_SRC))

$(BINDIR)/%.c.o: $(SRCDIR)/%.c $(CONFIG_HEADER)
	$(GUARD)
	$(TARGET_CC) $(KCFLAGS) -c -o $@ $<

$(BINDIR)/%.s.o: $(SRCDIR)/%.s $(CONFIG_HEADER)
	$(GUARD)
	$(TARGET_CC) $(KCFLAGS) -c -o $@ $<

$(KERNEL_ELF): $(KERNEL_OBJ)
	$(GUARD)
	$(TARGET_LD) $(KLDFLAGS) -o $@ $(KERNEL_OBJ)
