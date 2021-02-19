ELF2UF2=$(BINDIR)/tools/elf2uf2
CONF=$(TOOLDIR)/config.py

$(ELF2UF2): $(TOOLDIR)/elf2uf2.cpp
	$(GUARD)
	$(CXX) $(CXXFLAGS) -o $@ $<
