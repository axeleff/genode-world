LIBPCAP_DIR := $(call select_from_ports,libpcap)/src/lib/libpcap

PUBHDR = \
	pcap.h \
	pcap-bpf.h \
	pcap-namedb.h \
	pcap/bpf.h \
	pcap/bluetooth.h \
	pcap/can_socketcan.h \
	pcap/dlt.h \
	pcap/export-defs.h \
	pcap/ipnet.h \
	pcap/namedb.h \
	pcap/nflog.h \
	pcap/pcap.h \
	pcap/sll.h \
	pcap/vlan.h \
	pcap/usb.h

HDR = $(PUBHDR) \
	arcnet.h \
	atmuni31.h \
	ethertype.h \
	extract.h \
	gencode.h \
	ieee80211.h \
	llc.h \
	nametoaddr.h \
	nlpid.h \
	pcap-common.h \
	pcap-int.h \
	pcap-stdinc.h \
	portability.h \
	ppp.h \
	sf-pcap.h \
	sf-pcap-ng.h \
	sunatmpos.h

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
LEX = flex

GENHDR = \
        scanner.h grammar.h pcap_version.h

TAGFILES = \
        $(SRC) $(HDR)

SRC_CC = $(addprefix $(LIBPCAP_DIR)/, $(SRC_LIBPCAP)) $(SRC_LIBPCAP) $(LIBPCAP_DIR)/pcap/ $(HDR)

SRC_CC = $(addprefix $(LIBPCAP_DIR)/, $(notdir $(wildcard $(LIBPCAP_DIR)/*.c)))

INC_DIR += $(LIBPCAP_DIR)/pcap/ $(LIBPCAP_DIR)  $(LIBPCAP_DIR)/bluetooth

LIBS += libc libc_lwip lwip pthread stdcxx lxip base net libnlpcap

CC_DEF += -DWITH_SOCKS -DWITH_THREADING

SHARED_LIB = yes

CC_OPT += -O2
