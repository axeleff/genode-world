OPL_DIR := $(call select_from_ports,libpcap)/src/lib/openpowerlink

SRC_OPL := logging_mosq.c \
        memory_mosq.c \
        messages_mosq.c \
        mosquitto.c \
        net_mosq.c \
        read_handle.c \
        read_handle_client.c \
        read_handle_shared.c \
        send_client_mosq.c \
        send_mosq.c \
        socks_mosq.c \
        srv_mosq.c \
        thread_mosq.c \
        time_mosq.c \
        tls_mosq.c \
        util_mosq.c \
        will_mosq.c

INC_DIR += $(OPL_DIR) $(OPL_DIR)/lib $(OPL_DIR)/lib/cpp/

SRC_CC = $(addprefix $(OPL_DIR)/lib/, $(SRC_OPL)) $(OPL_DIR)/lib/cpp/mosquittopp.cpp

LIBS += libc libc_lwip lwip pthread stdcxx

CC_DEF += -DWITH_EC -DWITH_SOCKS -DWITH_THREADING

SHARED_LIB = yes

CC_OPT += -O2
