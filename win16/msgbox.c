/*
 *  "Hello world" in C using the Windows 16-bit API.
 *
 *  This is a GUI app that uses MessageBox(), called from WinMain().
 *
 *  Via http://www.charlespetzold.com/blog/2014/12/The-Infamous-Windows-Hello-World-Program.html
 *
 *  This example app should compile with any Win16 C compiler.
 */

#include <windows.h>

static char *text = "Hello world.";
static char *title = "Hello!";

int PASCAL WinMain(HINSTANCE hInst, HINSTANCE hPrevInst, LPSTR lpCmdLine, int nCmdShow)
{
     MessageBox(NULL, text, title, MB_OK);
     return 0 ;
}
