TARGET   = test-openpowerlink
LIBS     = stdcxx net openpowerlink pthread
OPL_SRC = $(call select_from_ports,openpowerlink)
EX_DIR   = $(OPL_SRC)
INC_DIR  = $(EX_DIR)

SRC_CN_CONSOLE = opentest.c
SRC_CC   = $(addprefix $(OPL_SRC)/openpowerlink/app/, $(SRC_CN_CONSOLE))

#vpath %.c %.cpp $(EX_DIR)
