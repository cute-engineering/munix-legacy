#ifndef KERNEL_TASK_H
#define KERNEL_TASK_H

#include <common/config.h>

struct task
{
	int id;
	char name[CONFIG_TASK_NAME_SIZE];
};

#endif