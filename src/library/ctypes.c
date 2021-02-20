#include "ctype.h"

int
isspace(int c)
{
	if (c == ' ' || c == '\n' || c == '\r' || c == '\t' || c == '\v')
	{
		return 1;
	}
	else
	{
		return 0;
	}
}

int
isalnum(int c)
{
	if (c <= 'z' && c >= 'a')
	{
		return 1;
	}
	if (c <= 'Z' && c >= 'A')
	{
		return 1;
	}
	if (c <= '9' && c >= '0')
	{
		return 1;
	}
	return 0;
}

int
isdigit(int c)
{
	if (c <= '9' && c >= '0')
	{
		return 1;
	}
	return 0;
}

int
isalpha(int c)
{
	if (c <= 'z' && c >= 'a')
	{
		return 1;
	}
	if (c <= 'Z' && c >= 'A')
	{
		return 1;
	}
	return 0;
}

int
to_lower(int c)
{
	if (c >= 'A' && c <= 'Z')
	{
		c -= 'A';
		c += 'a';
	}
	return c;
}

int
to_upper(int c)
{
	if (c >= 'a' && c <= 'z')
	{
		c -= 'a';
		c += 'A';
	}
	return c;
}