CFLAGS += $(INCLUDES)

ELF2UF2=$(BINDIR)/tools/elf2uf2

$(ELF2UF2): $(SRCDIR)/tools/elf2uf2.cpp
	$(GUARD)
	$(CXX) $(CFLAGS) -o $@ $<

test: $(ELF2UF2)