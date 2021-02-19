CFLAGS += $(INCLUDES)

ELF2UF2=$(TOOLDIR)/elf2uf2
CONF=tools/config.py

$(ELF2UF2): tools/elf2uf2.cpp
	$(GUARD)
	$(CXX) $(CFLAGS) -o $@ $<
