/*
 *  "Hello world" in C using the OS/2 API.
 */

#include <stdio.h>

#define INCL_DOSPROCESS
#include <os2.h>

static char msg[] = "Hello world.\n";

int main(void)
{
#if defined(__386__) || defined(i386)
    ULONG written;
#else
    USHORT written;
#endif

    DosWrite(1, msg, sizeof msg, &written);
    return 0;
}
