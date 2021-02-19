#include "string.h"

size_t
strlen(const char *s)
{
	size_t i = 0;
	while (s[i] != '\0') {
		i++;
	}
	return i;
}

size_t
strnlen(const char *s, size_t maxlen)
{
	size_t i = 0;
	while (s[i] != '\0' && i < maxlen) {
		i++;
	}
	return i;
}

int
strcmp(const char *s1, const char *s2)
{
	size_t idx = 0;
	while (s1[idx] == s2[idx] && s1[idx]) {
		idx++;
	}
	return (int)s1[idx] - (int)s2[idx];
}