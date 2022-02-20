.include "io.S"

.global _start

_start:
	fcall putint $-3141
	fscall $exit
