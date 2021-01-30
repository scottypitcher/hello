      ***************************************************************
      *  hello.cbl
      *
      *  Print "Hello world." and the number 42 to standard output.
      *
      *  Compile with:
      *
      *  cobc -x hello.cbl
      ***************************************************************

       identification division.
       program-id. hello.
       environment division.
       data division.
       working-storage section.
       01 gp-1.
           02 A pic 9(2).
       procedure division.
       main-para.
           display "Hello world."
           move 21 to A.
           multiply 2 by A.
           display "A is " A ".".
           stop run.
