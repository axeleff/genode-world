TARGET   = test-openpowerlink
LIBS     = libpcap stdcxx net
OPL_SRC = $(call select_from_ports,openpowerlink)/src/lib/openpowerlink/
EX_DIR   = $(OPL_SRC)/tests
INC_DIR  = $(EX_DIR)
SRC_CC   = opentest.c

vpath %.cpp $(EX_DIR)
