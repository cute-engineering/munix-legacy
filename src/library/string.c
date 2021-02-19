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

int
strncmp(const char *s1, const char *s2, size_t maxlen)
{
	size_t idx = 0;
	while (s1[idx] == s2[idx] && s1[idx] && maxlen) {
		idx++;
		maxlen--;
	}
	if (maxlen == 0) {
		return 0;
	}
	return (int)s1[idx] - (int)s2[idx];
}

void *
memset(void *s, int c, size_t n)
{

	unsigned char *v = (unsigned char *)s;
	for (int i = 0; i < n; i++) {
		v[i] = c;
	}
	return s;
}

void *
memcpy(void *dest, const void *src, size_t n)
{
	const unsigned char *c_src = (const unsigned char *)src;
	unsigned char *c_dest = (unsigned char *)dest;

	for (int i = 0; i < n; i++) {
		c_dest[i] = c_src[i];
	}
	return dest;
}