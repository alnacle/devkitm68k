include $(NGDEV)/config.mk

INCDIR = $(NGDEV)/nglib/include
LIBDIR = $(NGDEV)/nglib/lib
LIBTOOLCHAIN = $(NGDEV)/toolchain/lib
LIBGCC = $(NGDEV)/toolchain/lib/gcc/m68k-elf/4.9.2

ROMSIZE = 0x20000
PADBYTE = 0x00

OBJS = crt0.o main.o
LIBS = -lng -lgcc

ASFLAGS = -m68000 --register-prefix-optional
LDFLAGS = -T $(NGDEV)/ldconfig/ng_aes.ld -L$(NGDEV)/crt -L$(LIBDIR) -L$(LIBTOOLCHAIN) -L$(LIBGCC)
CCFLAGS = -m68000 -O3 -Wall -fomit-frame-pointer -ffast-math -fno-builtin -nostartfiles -nodefaultlibs 
PLFLAGS = -c --fix 

ARFLAGS = cr

dev_p1.rom : test.o
	$(OBJCOPY) --gap-fill=$(PADBYTE) --pad-to=$(ROMSIZE) -R .data -O binary $< $@

test.o : $(OBJS)
	$(LD) -L$(LIBDIR) $(LDFLAGS) $(OBJS) $(LIBS) -o $@

%.o: %.c
	$(CC) -I$(INCDIR) $(CCFLAGS) -c $< -o $@

%.o: %.s
	$(AS) $(ASFLAGS) $< -o $@

clean:
	rm -f *.o
	rm -f test.o
	rm -f dev_p1.rom

.PHONY: clean dev_p1.rom
