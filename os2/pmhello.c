/*
 *  "Hello world" in C using the OS/2 API.
 *
 *  This is a Presentation Manager GUI app that executes a message loop.
 */

#define INCL_WIN
#define INCL_DOSPROCESS
#include <os2.h>

#if defined(__386__) || defined(i386)
#ifndef _OS2V2
#define _OS2V2 1
#endif
#endif

#define TEXT_MARGIN 5

static char *CLASS_NAME = "PMHello";

static struct
{
    HAB hab;
    HMQ hmq;
    QMSG qmsg;
    HWND hwndClient;
    ULONG style;
}
app;

static void WindowPaint(HWND hwnd)
{
    RECTL r;
    HPS hps;
    char text[] = "Hello world.";
    char text2[] = "Click anywhere inside the window to close it.";

    hps = WinBeginPaint(hwnd, 0, NULL);
    WinQueryWindowRect(hwnd, &r);
    WinFillRect(hps, &r, CLR_DARKBLUE);
    r.xLeft += TEXT_MARGIN;
    r.yTop -= TEXT_MARGIN;

    WinDrawText(WinGetPS(hwnd), -1, text, &r, CLR_WHITE, CLR_BACKGROUND, DT_LEFT | DT_TOP);

    r.yTop -= 60;

    WinDrawText(WinGetPS(hwnd), -1, text2, &r, CLR_WHITE, CLR_BACKGROUND, DT_LEFT | DT_TOP);

    WinEndPaint(hwnd);
}

static void WindowDestroy(HWND hwnd)
{
    WinPostMsg(hwnd, WM_QUIT, 0, 0);
}

#ifdef _OS2V2
MRESULT EXPENTRY WndProc(HWND hwnd, ULONG msg, MPARAM mp1, MPARAM mp2)
#else
MRESULT EXPENTRY WndProc(HWND hwnd, USHORT msg, MPARAM mp1, MPARAM mp2)
#endif
{
    switch (msg)
    {
    case WM_BUTTON1DOWN:
        WindowDestroy(hwnd);
        return 0;

    case WM_PAINT:
        /* either OS/2 or the app requested the window be repainted */
        WindowPaint(hwnd);
        return 0;
    }

    /* switch fell through, so the default no-op function is called */

    return WinDefWindowProc(hwnd, msg, mp1, mp2);
}

static void WindowError(char *error)
{
    WinMessageBox(HWND_DESKTOP, HWND_DESKTOP, error, "Error", 0, MB_ERROR | MB_OK | MB_SYSTEMMODAL | MB_MOVEABLE);
    DosExit(EXIT_PROCESS, 1);
}

static void AppInit(void)
{
    HWND hwnd;

    app.hab = WinInitialize(0);
    app.hmq = WinCreateMsgQueue(app.hab, 0);
    WinRegisterClass(app.hab, CLASS_NAME, WndProc, 0, 0);

    app.style = FCF_SYSMENU | FCF_TITLEBAR | FCF_SIZEBORDER | FCF_SHELLPOSITION | FCF_MINMAX;

    hwnd = WinCreateStdWindow(
        HWND_DESKTOP,                /* desktop window handle */
        WS_VISIBLE | FS_TASKLIST,    /* frame style */
        &app.style,                  /* window style */
        CLASS_NAME,                  /* pszClientClass */
        "Hello!",                    /* window title */
        0,                           /* flClientStyle */
        0,                           /* hmodResource */
        0,                           /* ulFrameId */
        &app.hwndClient              /* the returned HWND */
    );

    if (!hwnd)
    {
        WindowError("WinCreateStdWindow() failed.");
    }
}

static void AppRun(void)
{
    while (WinGetMsg(app.hab, &app.qmsg, 0, 0, 0) == TRUE)
    {
        WinDispatchMsg(app.hab, &app.qmsg);
    }
}

static void AppTerm(void)
{
    WinDestroyMsgQueue(app.hmq);
    WinTerminate(app.hab);
}

int main(void)
{
    AppInit();
    AppRun();
    AppTerm();
    return 0;
}
