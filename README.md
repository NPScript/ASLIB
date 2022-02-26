# ASLIB - *A*ssembly *S*tandart *Lib*rary

```
┏━┓┏━┓╻  ╻┏┓
┣━┫┗━┓┃  ┃┣┻┓
╹ ╹┗━┛┗━╸╹┗━┛
```

This is a small library to make writing in assembly more efficient.
This library is standalone, so it can be used without any other libraries.
It is written in the *AT&T* syntax.

# Features

This features should be contained by this library:

- [x] Macros to make function-calls easier
- [-] Printing functions
	- [x] Character printing
	- [x] String printing
	- [x] Integer printing
	- [ ] Format printing
- [ ] String Manipulations
- [ ] File reading and writing support
- [ ] Filesystem functions
- [ ] Arg Helper

# Function calls

To make function-calls simpler *ASLIB* provides the following macros:

```
fcall fname arg1 arg2 ...
```

To call functions in a easy way use the *fcall* function and pass a function
name (*fname* in the example) and its arguments.

The arguments are passed through the registers like in the systemcalls:

| arg1 | arg2 | arg3 | arg4 | arg5 | arg6 |
| :--- | :--- | :--- | :--- | :--- | :--- |
| rdi  | rsi  | rdx  | r10  | r8   | r9   |


There is also a macro to simplify the usage of *syscalls*:

```
fscall $syscallname arg1 arg2 ...
```

To see a list of all systemcalls read the manpage `syscalls`.
In the file `constants.S` every syscallname is mapped with its number so
the syscall can be called for example by `fscall $exit` instead of `fscall $60`.
