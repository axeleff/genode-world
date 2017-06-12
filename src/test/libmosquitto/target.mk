TARGET   = test-libmosquitto
LIBS     = libmosquitto stdcxx
MOSQ_SRC = $(call select_from_ports,libmosquitto)/src/lib/libmosquitto/
EX_DIR   = $(MOSQ_SRC)/examples/temperature_conversion
INC_DIR  = $(EX_DIR)
SRC_CC   = main.cpp temperature_conversion.cpp

vpath %.cpp $(EX_DIR)
