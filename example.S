.include "io.S"

.global _start

_start:
	fcall putuint $3141
	fscall $exit
