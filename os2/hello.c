/*
 *  "Hello world" in C using the OS/2 API.
 *
 *  There are two examples here:
 *
 *  The first uses DosWrite() to write to standard output. The output
 *  can be redirected.
 *
 *  The second example uses VioWrtTTY(), writing directly to the display,
 *  beginning at the current cursor location. This can't be redirected.
 */

static char msg[] = "Hello world.\n";

#if 1

/* write to standard output */

#define INCL_DOSPROCESS
#include <os2.h>

#include "_os2v2.h"

#ifndef STDIN_FILENO

/* OS/2 uses the three standard POSIX file descriptors: */

#define STDIN_FILENO  0
#define STDOUT_FILENO 1
#define STDERR_FILENO 2

#endif

int main(void)
{
#ifdef _OS2V2
    /* 32-bit OS/2 2.0 allows us to write more than 64 KB at a time */
    ULONG written;
#else
    USHORT written;
#endif

    DosWrite(STDOUT_FILENO, msg, sizeof msg - 1, &written);

    return 0;
}

#else

/* write directly to the screen */

#define INCL_VIO

#include <os2.h>

int main(void)
{
    VioWrtTTY(msg, sizeof msg - 1, 0);
    return 0;
}

#endif
