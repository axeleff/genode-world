SHARED_LIB = yes


LIB_DIR     = $(REP_DIR)/src/lib/libnl
LIB_INC_DIR = $(LIB_DIR)/include

LIBS += libc libnl_include

LIBNL_CONTRIB_DIR := $(call select_from_ports,dde_linux)/src/lib/libnl

INC_DIR += $(LIB_INC_DIR)
INC_DIR += $(LIBNL_CONTRIB_DIR)/include $(LIBNL_CONTRIB_DIR)/include/linux

SRC_CC += lxcc_emul.cc socket.cc if.cc

# libnl
SRC_C += $(addprefix lib/, attr.c cache.c cache_mngt.c data.c error.c handlers.c \
                           hashtable.c msg.c nl.c object.c socket.c utils.c)

# libnl-genl
SRC_C += $(addprefix lib/genl/, ctrl.c family.c genl.c mngt.c)

CC_OPT   += -DSYSCONFDIR=\"/\"
CC_C_OPT += -include $(LIB_INC_DIR)/libnl_emul.h -include $(LIB_INC_DIR)/linux/types.h

CC_OPT += -D_LINUX_SOCKET_H

# libnl-route
#SRC_C += $(wildcard lib/fib_lookup/*.c)   \
#         $(wildcard lib/route/act/*.c)    \
#         $(wildcard lib/route/cls/*.c)    \
#         $(wildcard lib/route/link/*.c)   \
#         $(wildcard lib/route/qdisc/*.c)  \
#         $(wildcard lib/route/*.c)

# libnl-netfilter
#SRC_C += $(wildcard lib/netfilter/*.c)

# libnl-diag
#SRC_C += $(wildcard lib/idiag/*.c)

vpath %.c  $(LIBNL_CONTRIB_DIR)
vpath %.c  $(LIB_DIR)
vpath %.cc $(LIB_DIR)
