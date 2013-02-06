# Makefile
#
# Makefile for the Arduino RF22 project
#
# Author: Mike McCauley (mikem@open.com.au)
# Copyright (C) 2011 Mike McCauley
# $Id: Makefile,v 1.6 2012/09/05 23:31:39 mikem Exp mikem $

PROJNAME = RF22
# Dont forget to also change the version at the top of RF22.h:
DISTFILE = $(PROJNAME)-1.24.zip

all:	doxygen dist upload

doxygen: 
	doxygen project.cfg

ci:
	(cd ..;ci -l `cat $(PROJNAME)/MANIFEST`)

dist:	
	(cd ..; zip $(PROJNAME)/$(DISTFILE) `cat $(PROJNAME)/MANIFEST`)

upload:
	rsync -avz $(DISTFILE) doc/ server2:/var/www/html/mikem/arduino/$(PROJNAME)

#	scp $(DISTFILE) doc/*.html doc/*.gif doc/*.png doc/*.css doc/*.pdf server2:/var/www/html/mikem/arduino/$(PROJNAME)
