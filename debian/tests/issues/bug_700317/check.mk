#!/usr/bin/make -f

# Origin: https://bugs.ghostscript.com/show_bug.cgi?id=700317
#
# targets correspond with comments in above issue tracker

ROOT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

GS ?= gs

all: c0 c4 c6

c0: $(ROOT_DIR)/c0.ps
	$(GS) -sDEVICE=ppmraw -dSAFER -f $< 2>&1 \
		| grep --quiet --fixed-strings --line-regexp \
		--regexp 'Error: /undefined in pdfdict'

# skip c1 essentially equal to c0 just demonstrating different abuse

c4: $(ROOT_DIR)/c4.ps
	$(GS) -dSAFER -sDEVICE=ppmraw -sOutputFile=/dev/null -f $< 2>&1 \
		| grep --quiet --fixed-strings --line-regexp \
		--regexp 'Error: /undefined in pdfdict'

c6: $(ROOT_DIR)/c6.ps
	$(GS) -dSAFER -sDEVICE=ppmraw -sOutputFile=/dev/null -f $< 2>&1 \
		| grep --quiet --fixed-strings --line-regexp \
		--regexp 'Error: /undefined in pdfdict'
