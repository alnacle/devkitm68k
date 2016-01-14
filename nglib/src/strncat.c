#include <string.h>

char* strncat(char *dest, const char *src, size_t count)
{
	char *tmp = dest;

    dest += strlen(dest);

    while (count && *src) {
        count--;
        *dest++ = *src++;
    }

    *dest++ = 0;

    return tmp;
}
