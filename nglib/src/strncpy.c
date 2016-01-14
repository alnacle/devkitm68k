#include <string.h>
#include <stdlib.h>

char* strncpy(char * dst,const char *src, size_t count)
{
	char *tmp = dst;

	while (count-- && (*dst++ = *src++) != '\0');

	return tmp;
}

