
#ifndef __STDLIB_H__
#define __STDLIB_H__

/* Implemented on memory.s */ 

extern void*	memcpy(void *dest, const void *src, size_t count);
extern void*	memmove(void *dest, const void *src, size_t count);
extern void*	memset(void *dest, int ch, size_t count);

#endif // __STDLIB_H__
