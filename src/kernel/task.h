#ifndef _MUNIX_KERNEL_TASK_H
#define _MUNIX_KERNEL_TASK_H

#include <common/config.h>

struct task
{
	int id;
	char name[CONFIG_TASK_NAME_SIZE];
};

#endif /* !_MUNIX_KERNEL_TASK_H */