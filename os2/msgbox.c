/*
 *  "Hello world" for OS/2.
 *
 *  A Presentation Manager GUI app that calls WinMessageBox() to display
 *  a message on the screen.
 */

#define INCL_WIN
#include <os2.h>

static char *text = "Hello world.";
static char *title = "Hello!";

int main(void)
{
    HAB hab;
    HMQ hmq;

    /*
     *  Unlike in Windows, in OS/2 it's necessary to initialise the windowing
     *  system before we call other GUI functions, like WinMessageBox().
     */

    hab = WinInitialize(0);
    hmq = WinCreateMsgQueue(hab, 0);

    WinMessageBox(HWND_DESKTOP, HWND_DESKTOP, text, title, 0,
      MB_ICONEXCLAMATION | MB_OK | MB_SYSTEMMODAL | MB_MOVEABLE);

    WinDestroyMsgQueue(hmq);
    WinTerminate(hab);

    return 0;
}
