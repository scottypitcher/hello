/*
 *  "Hello world" in C using the 32-bit Windows API.
 *
 *  This is a GUI app that executes a message loop, called from WinMain().
 *
 *  Via:
 *
 *  https://docs.microsoft.com/en-us/windows/desktop/learnwin32/your-first-windows-program
 *  http://www.winprog.org/tutorial/simple_window.html
 *  https://www.paulgriffiths.net/program/c/srcs/winhellosrc.html
 *  https://bell0bytes.eu/hello-world/
 *  http://www.charlespetzold.com/blog/2014/12/The-Infamous-Windows-Hello-World-Program.html
 *
 *  This example app should compile with any Win32 or Win64 C compiler,
 *  beginning with Microsoft Visual C++ 1.0 from 1993.
 *
 *  ------------------------------------------------------------------------------------------
 *
 *  Many sample "Hello world" programs for the Win32 API fail to check
 *  return codes for errors when calling the main API functions. This app
 *  isn't perfect but should be an improvement.
 *
 *  The code has been refactored to be more modular, which should help if you
 *  use it as a base for a more complex program.
 *
 *  For a bit of nostalgia you can #define NORTON_COLOR and the app will use
 *  the same background colour as the old Norton Utilities for DOS.
 */

#define WIN32_LEAN_AND_MEAN

#include <windows.h>
#include <string.h>

#if NORTON_COLOR
/* throwback to Norton Utilities colour scheme */
#define BG_COLOR RGB(0x55, 0x55, 0xFF)
#else
/* "dark mode" */
#define BG_COLOR RGB(0x18, 0x25, 0x33)
#endif

#define FG_COLOR RGB(0xFF, 0xFF, 0xFF)
#define TEXT_MARGIN 5

static const char CLASS_NAME[]  = "WinHello";

static struct
{
    WNDCLASS wc;
    HWND hwnd;
    MSG msg;
}
app;

static void WindowError(char *error)
{
    MessageBox(NULL, error, "Error", MB_ICONEXCLAMATION | MB_OK);
    ExitProcess(1);
}

static void WindowDestroy(void)
{
    PostQuitMessage(0);
}

static void WindowPaint(HWND hwnd)
{
    HDC hdc;
    PAINTSTRUCT ps;
    RECT r;
    char text[] = "Hello world.";
    char text2[] = "Click anywhere inside the window to close it.";

    GetClientRect(hwnd, &r);
    hdc = BeginPaint(hwnd, &ps);
    FillRect(hdc, &ps.rcPaint, CreateSolidBrush(BG_COLOR));
    SetBkMode(hdc, TRANSPARENT);
    SetTextColor(hdc, FG_COLOR);

    /* move the text away from the borders */

    r.left += TEXT_MARGIN;
    r.top += TEXT_MARGIN;

    /* display "Hello world." */

    /* instead of TextOut() we could use DrawText() */

    TextOut(hdc, r.left, r.top, text, (int) strlen(text));

    /* now move down 60 pixels to the next row and output the second line of text */

    TextOut(hdc, r.left, r.top + 60, text2, (int) strlen(text2));

    EndPaint(hwnd, &ps);
}

static LRESULT CALLBACK WindowProc(HWND hwnd, UINT uMsg, WPARAM wParam, LPARAM lParam)
{
    switch (uMsg)
    {
    case WM_DESTROY:        /* user clicked window close box, or pressed Alt+F4 */
    case WM_LBUTTONDOWN:    /* user clicked left mouse button */
        WindowDestroy();
        return 0;

    case WM_PAINT:          /* either Windows or the app requested the window be repainted */
        WindowPaint(hwnd);
        return 0;
    }

    /* switch fell through, so the default no-op function is called */

    return DefWindowProc(hwnd, uMsg, wParam, lParam);
}

static void AppInit(HINSTANCE hInstance)
{
    /* set up some sane defaults */

    app.wc.lpfnWndProc   = WindowProc;
    app.wc.hInstance     = hInstance;
    app.wc.hIcon         = LoadIcon(NULL, IDI_APPLICATION);
    app.wc.hCursor       = LoadCursor(NULL, IDC_ARROW);
    app.wc.hbrBackground = CreateSolidBrush(BG_COLOR);
    app.wc.lpszClassName = CLASS_NAME;

    if (RegisterClass(&app.wc) == 0)
    {
        WindowError("RegisterClass failed.");
    }

    app.hwnd = CreateWindowEx(
        0,                              /* optional window styles */
        CLASS_NAME,                     /* window class */
        "Hello, world!",                /* window title text */
        WS_OVERLAPPEDWINDOW,            /* window style */
        CW_USEDEFAULT, CW_USEDEFAULT,   /* window x & y position */
        CW_USEDEFAULT, CW_USEDEFAULT,   /* window width & height */
        NULL,                           /* parent window */
        NULL,                           /* pull-down menu */
        hInstance,                      /* instance handle */
        NULL                            /* additional application data */
    );

    if (app.hwnd == NULL)
    {
        WindowError("CreateWindowEx failed.");
    }
}

static int AppRun(int nCmdShow)
{
    ShowWindow(app.hwnd, nCmdShow);

    /*
     *  Here we call UpdateWindow() which will send a WM_PAINT message to the event
     *  loop. Other examples leave this out so it may not be strictly necessary.
     */

    if (UpdateWindow(app.hwnd) == 0)
    {
        WindowError("UpdateWindow failed.");
    }

    /*
     *  Below is the main Windows event loop, common to every Windows GUI app.
     *
     *  Despite returning a BOOL, GetMessage() returns:
     *
     *  0  when there are no messages left
     *  >0 when there are messages in the queue
     *  -1 on failure
     *
     *  It's a common bug not to check for a return value of -1 from GetMessage().
     *  Many of Microsoft's own examples fail to do this!
     */

    while (1)
    {
        BOOL rc = GetMessage(&app.msg, NULL, 0, 0);

        if (rc == -1)
        {
            WindowError("GetMessage failed.");
        }
        else if (rc == 0)
        {
            return 0;
        }

        TranslateMessage(&app.msg);
        DispatchMessage(&app.msg);
    }
}

int WINAPI WinMain(HINSTANCE hInst, HINSTANCE hPrevInst, LPSTR lpCmdLine, int nCmdShow)
{
    AppInit(hInst);
    return AppRun(nCmdShow);
}
