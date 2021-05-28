ARCHCFLAGS := \
			-ffreestanding       \
			-fno-stack-protector \
			-fno-pic -fpie       \
			-mno-80387           \
			-mno-mmx             \
			-mno-3dnow           \
			-mno-sse             \
			-mno-sse2            \
			-mno-red-zone
 
ARCHLDFLAGS := \
			-fno-pic -fpie \
			-Wl,-static,-pie,--no-dynamic-linker,-ztext \
			-static-pie    \
			-nostdlib      \
			-T $(SRCDIR)/arch/$(CONFIG_TARGET_ARCH)/link.ld    \
			-z max-page-size=0x1000
