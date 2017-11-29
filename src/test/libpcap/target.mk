TARGET   = test-libpcap
LIBS     = libpcap stdcxx
PCAP_SRC = $(call select_from_ports,libpcap)/src/lib/libpcap/
EX_DIR   = $(PCAP_SRC)/tests
INC_DIR  = $(EX_DIR)
SRC_CC   = opentest.c

vpath %.cpp $(EX_DIR)
