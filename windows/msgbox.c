/*
 *  "Hello world" in C using the Windows API.
 *
 *  This is a GUI app that uses MessageBox(), called from WinMain().
 *
 *  Via http://www.charlespetzold.com/blog/2014/12/The-Infamous-Windows-Hello-World-Program.html
 */

#define WIN32_LEAN_AND_MEAN

#include <windows.h>

#include "_win32.h"

static char *text = "Hello world.";
static char *title = "Hello!";

#ifdef _WIN32
int WINAPI WinMain(HINSTANCE hInst, HINSTANCE hPrevInst, LPSTR lpCmdLine, int nCmdShow)
#else
int PASCAL WinMain(HINSTANCE hInst, HINSTANCE hPrevInst, LPSTR lpCmdLine, int nCmdShow)
#endif
{
     MessageBox(NULL, text, title, MB_OK);
     return 0;
}
