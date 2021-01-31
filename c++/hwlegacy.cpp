//
//  "Hello world" in legacy C++.
//
//  "Legacy C++" is considered pre-C++98, prior to the introduction of the
//  std:: namespace in modern C++.
//
//  Old DOS compilers such as Borland Turbo C++ 1.0 from 1990, Borland C++
//  3.1 from 1992, early versions of Microsoft Visual C++, etc. predate the
//  C++98 standard and don't support the std:: namespace, among other features
//  of modern C++.
//
//  For I/O streams such as cout, they use the iostream.h header file instead
//  of iostream.
//

#include <iostream.h>

int main()
{
    cout << "Hello world.\n";
    return 0;
}
