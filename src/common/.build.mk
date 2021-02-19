CONFIG_HEADER=$(SRCDIR)/common/config.h

$(CONFIG_HEADER): .config
	$(CONF) --genheader $@