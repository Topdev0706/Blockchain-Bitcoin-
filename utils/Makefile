# Makefile assumes the following \
(1) k.h header file is located in current folder \
(2) kdb+ version >= 3.0 on 64-bit linux (l64) with gcc   \
(3) Q version is 32bit (If not change QVER below to 64   

# Set CFLAG depending on Q version
QVER := 32
ifeq ($(QVER),64)
   CFLAG=-m64
else
   CFLAG=-m32
endif

# Set location of c.o object file to use 
LBITS := $(shell getconf LONG_BIT)
ifeq ($(LBITS),64)
   OBJHOME=l64
else
   OBJHOME=l32
endif

all : cryptoLib
CC=gcc
OPTS=-D KXVER=3 -Wall -fno-strict-aliasing -Wno-parentheses -Wno-pointer-sign -g -O2
LDOPTS=-lpthread
CRYPTOPTS=-lcrypto -lssl
OBJ=$(OBJHOME)/c.o

cryptoLib:
	$(CC) $(CFLAG) $(OPTS) -shared -fPIC -o cryptoLib.so cryptoLib.c $(LDOPTS) $(CRYPTOPTS)

clean:
	rm cryptoLib.so
