# Learning Assembly Language

These are some exercise programs on my way to learning assembly language
programming. I have tried both [gas](https://en.wikibooks.org/wiki/X86_Assembly/GAS_Syntax) and [nasm](https://www.nasm.us/).

## Resources

* https://gist.github.com/FiloSottile/7125822
* http://www.int80h.org/bsdasm/
* https://en.wikipedia.org/wiki/X86_calling_conventions
* https://github.com/0xAX/asm
* https://www.cs.uaf.edu/2017/fall/cs301/reference/x86_64.html
* https://www.csee.umbc.edu/portal/help/nasm/sample.shtml
* https://llvm.org/docs/LangRef.html#add-instruction
* https://en.wikibooks.org/wiki/X86_Assembly
* https://cs.lmu.edu/~ray/notes/nasmtutorial/
* https://asmtutor.com/#lesson1

## Todos

* translate a gas program compiled from C to nasm
* convert itoa to 64
* write strlen function
* translate a nasm program to gas
* learn to use gdb on gas code
* learn macros
* learn to use the stack to pass values to functions
* what is rel (as explained [here](https://stackoverflow.com/questions/13091987/x64-nasm-pushing-memory-addresses-onto-the-stack-call-function))?
* try writing asm on windows and using their debugger (Handmade Hero tutorial)
* use malloc to simulate arrays, strings, and structs
* digging into binary opcode format to understand things at a lower level
* learn writing asm for the Arduino
* connect what I learned in nasm back in gas syntax
* port some programs to osx 64 (done)
* port some programs to osx 32 (done)
* learn how to do these in 64-bit osx so I don't have to use Docker (done)
* learn to use lea (partially done)
* figure out how to use debugger (gave up)
* write some slightly more complex programs (done)
* extract a set of useful library functions: (atoi(x), itoa(x), reverse_string)
* write into a string buffer (done)
* reverse the string (done)
* print a number w/o printf - (done)
* convert a string number into a number (done)

## Ideas for Programs

* reverse guess a number game
* word count (wc) program
* guess a number game
* possible to have the guess a number game vs a reverse guess a number game?
* word summary program
* fizzbuzz
* calculator / tally program (calc.asm)

## Videos

I made a [couple of videos](https://www.youtube.com/playlist?list=PLSq9OFrD2Q3DCb7dxmvVudikqDeQW8tNL) on this topic.

## Questions

What is syscall?

## Common Mistakes

If you get a `Segmentation fault`, it's likely from not popping correctly after pushing to the
stack. There are other causes though.
