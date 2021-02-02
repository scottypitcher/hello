/*
 *  "Hello world" in C using the OS/2 API.
 */

#include <stdio.h>

#define INCL_DOSPROCESS
#include <os2.h>

#if defined(__386__) || defined(i386)
#ifndef _OS2V2
#define _OS2V2 1
#endif
#endif

static char msg[] = "Hello world.\n";

int main(void)
{
#ifdef _OS2V2
    ULONG written;
#else
    USHORT written;
#endif

    DosWrite(1, msg, sizeof msg, &written);
    return 0;
}
