/*
 *  "Hello world" in C using the 32-bit Windows API.
 *
 *  This is text mode (console) app that uses WriteFile() to send a
 *  string to the standard output.
 *
 *  This example app should compile with any Win32 or Win64 C compiler,
 *  beginning with Microsoft Visual C++ 1.0 from 1993.
 *
 *  WIN32_LEAN_AND_MEAN is defined here to speed up the compile by bypassing
 *  some non-essential Windows headers.
 */

#define WIN32_LEAN_AND_MEAN

#include <windows.h>

static char msg[] = "Hello world.\n";

int main(void)
{
    HANDLE hnd;
    hnd = GetStdHandle(STD_OUTPUT_HANDLE);
    WriteFile(hnd, msg, sizeof msg - 1, NULL, 0);
    return 0;
}
