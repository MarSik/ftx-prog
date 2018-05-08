PKG_CONFIG?=pkg-config
LIBFTDI_CFLAGS := $(shell $(PKG_CONFIG) --cflags libftdi1)
LIBFTDI_LDLIBS := $(shell $(PKG_CONFIG) --libs   libftdi1)

CFLAGS = -Wall -O2 -s -Werror $(LIBFTDI_CFLAGS)
LDFLAGS = $(LIBFTDI_LDLIBS) -s
PROG = ftx_prog

all:	$(PROG)

$(PROG):	$(PROG).c
	$(CC) $(CFLAGS) -o $@ $< $(LDFLAGS)

clean:
	rm -f $(PROG)
