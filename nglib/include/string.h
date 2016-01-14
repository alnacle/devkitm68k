#ifndef __STRING_H__
#define __STRING_H__

#include <stdlib.h>

#ifdef __cplusplus
extern "C" {
#endif

extern void* memcpy  (void *, const void *, size_t);
extern void* memmove (void *, const void *, size_t);
extern void* memset  (void *, int, size_t);

int memcmp(const void * cs,const void * ct, size_t count);

char* strcpy (char *dest, const char *src);
char* strncpy(char *dest, const char *src, size_t);

char* strcat (char *dest, const char *src);
char* strncat(char *dest, const char *src, size_t count);

size_t strlen (const char * s);
size_t strnlen(const char * s, size_t count);

#ifdef __cplusplus
}
#endif

#endif /* __STRING_H__ */
