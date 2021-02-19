#ifndef _MUNIX_LIBRARY_STRING_H
#define _MUNIX_LIBRARY_STRING_H

#include <stddef.h>

size_t strlen(const char *s);
size_t strnlen(const char *s, size_t maxlen);

int strcmp(const char *s1, const char *s2);
int strncmp(const char *s1, const char *s2, size_t maxlen);

#endif /* !_MUNIX_LIBRARY_STRING_H */
