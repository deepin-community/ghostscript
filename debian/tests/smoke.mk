#!/usr/bin/make -f

GS ?= gs

all: cli

cli:
	$(GS) --version \
		| grep --quiet --perl-regexp --regexp '^[\d.]+$$'
	$(GS) --help \
		| grep --quiet --fixed-strings --line-regexp \
		--regexp 'Usage: gs [switches] [file1.ps file2.ps ...]'
