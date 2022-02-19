.include "io.S"

_start:
	fcall putstring $msg
	fscall $exit

msg:
	.asciz "Hello World\n"
