LIBPCAP_DIR := $(call select_from_ports,libpcap)/src/lib/libpcap

SRC_LIBPCAP := grammer.h \
	pcap-linux.c \
        pcap-usb-linux.c \
        pcap-netfilter-linux.c \
        fad-getad.c \
        pcap.c \
        inet.c \
        fad-helpers.c \
        gencode.c \
        optimize.c \
        nametoaddr.c \
        etherent.c \
        savefile.c \
        sf-pcap.c \
        sf-pcap-ng.c \
        pcap-common.c \
        bpf_image.c \
        bpf_dump.c \
	scanner.c \
	grammar.c \
	bpf_filter.c

YACC = bison

INC_DIR += $(LIBPCAP_DIR) $(LIBPCAP_DIR)/ $(REP_DIR)/../libports/include/lwip

SRC_CC = $(addprefix $(LIBPCAP_DIR)/, $(SRC_LIBPCAP)) $(SRC_LIBPCAP) 

LIBS += libc libc_lwip lwip pthread stdcxx lxip libnl_include libnl

CC_DEF += -DWITH_SOCKS -DWITH_THREADING

SHARED_LIB = yes

CC_OPT += -O2
