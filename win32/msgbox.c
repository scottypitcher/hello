/*
 *  "Hello world" in C using the 32-bit Windows API.
 *
 *  This is a GUI app that uses MessageBox(), called from WinMain().
 *
 *  Via http://www.charlespetzold.com/blog/2014/12/The-Infamous-Windows-Hello-World-Program.html
 */

#define WIN32_LEAN_AND_MEAN

#include <windows.h>

static char *text = "Hello world.";
static char *title = "Hello!";

int WINAPI WinMain(HINSTANCE hInst, HINSTANCE hPrevInst, LPSTR lpCmdLine, int nCmdShow)
{
     MessageBox(NULL, text, title, MB_OK);
     return 0;
}
