//
// "Hello world" in Common Intermediate Language (CIL) for the Microsoft .NET Framework.
//
// Via https://www.i-programmer.info/programming/other-languages/933-getting-started-with-il.html
//

.assembly extern mscorlib {}
.assembly hello {}
.module hello.exe

.class hello.program

extends [mscorlib]System.Object
{
    .method static void Main()
    {
        .entrypoint
        ldstr "Hello world."
        call void [mscorlib]System.Console::WriteLine(string)
        ret
    }
}
