CC = arm-none-eabi-gcc
OBJCOPY = arm-none-eabi-objcopy

CFLAGS = -mcpu=cortex-m3 -mthumb -O0
LDFLAGS = -nostdlib

SRC = $(wildcard Bai*/*.c)
BIN = $(SRC:.c=.bin)

.PHONY: all clean

all: $(BIN)

%.bin: %.c
	$(CC) $(CFLAGS) -c $< -o $(@:.bin=.o)
	$(CC) $(CFLAGS) -c startup.s -o $(@D)/startup.o
	$(CC) $(CFLAGS) $(LDFLAGS) -T stm32f103c8.ld \
		$(@:.bin=.o) $(@D)/startup.o -o $(@:.bin=.elf)
	$(OBJCOPY) -O binary $(@:.bin=.elf) $@

clean:
	rm -f Bai*/*.o Bai*/*.elf Bai*/*.bin Bai*/startup.o
