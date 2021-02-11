#ifndef COMMON_MESSAGE_H
#define COMMON_MESSAGE_H

#include <common/config.h>

enum message_type
{
	MSG_INVALID = 0,
	MSG_ACK,
	MSG_ERROR,

	MSG_OPEN,
	MSG_CLOSE,
	MSG_READ,
	MSG_WRITE,
	MSG_DATA,
	MSG_END,
};

struct message
{
	enum message_type type;
	char payload[CONFIG_IPC_MESSAGE_SIZE - sizeof(enum message_type)];
};

#endif
