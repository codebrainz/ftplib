#
# Linux makefile for ftplib
#

PREFIX = /usr
CFLAGS = -g -Wall

all: libftp.a libftp.so.3.1.2 qftp ftplib.pc

libftp.a: ftplib.o
	ar rcs libftp.a ftplib.o

libftp.so.3.1.2: ftplib.os
	gcc $(CFLAGS) -shared -Wl,-soname,libftp.so.3 -o libftp.so.3.1.2 ftplib.os

ftplib.o: ftplib.c
	gcc $(CFLAGS) -c ftplib.c -o ftplib.o

ftplib.os: ftplib.c
	gcc $(CFLAGS) -c -fPIC ftplib.c -o ftplib.os

qftp: qftp.c
	gcc $(CFLAGS) -o qftp qftp.c -L. -lftp

ftplib.pc:
	@echo "prefix=$(PREFIX)" > ftplib.pc
	@echo "exec_prefix=$(PREFIX)" >> ftplib.pc
	@echo "includedir=$(PREFIX)/include" >> ftplib.pc
	@echo "libdir=$(PREFIX)/lib" >> ftplib.pc
	@echo "" >> ftplib.pc
	@echo "Name: ftplib" >> ftplib.pc
	@echo -n "Description: " >> ftplib.pc
	@echo -n "ftplib is a set of routines that implement " >> ftplib.pc
	@echo "the FTP protocol." >> ftplib.pc
	@echo "Version: 3.1.2" >> ftplib.pc
	@echo "Cflags: -I$(PREFIX)/include" >> ftplib.pc
	@echo "Libs: -L$(PREFIX)/lib -lftp" >> ftplib.pc
	@echo "" >> ftplib.pc
		
install:
	install -m 0644 ftplib.h $(PREFIX)/include
	install -m 0644 ftplib.pc $(PREFIX)/lib/pkgconfig
	install -m 0644 libftp.a $(PREFIX)/lib
	install -m 0644 libftp.so.3.1.2 $(PREFIX)/lib
	ln -sf $(PREFIX)/lib/libftp.so.3.1.2 $(PREFIX)/lib/libftp.so.3
	ln -sf $(PREFIX)/lib/libftp.so.3.1.2 $(PREFIX)/lib/libftp.so
	install -m 0755 qftp $(PREFIX)/bin
	mkdir -p $(PREFIX)/share/doc/ftplib
	cp -r html $(PREFIX)/share/doc/ftplib
	cp README* RFC959.txt CHANGES $(PREFIX)/share/doc/ftplib

uninstall:
	rm -f $(PREFIX)/include/ftplib.h
	rm -f $(PREFIX)/lib/pkgconfig/ftplib.pc
	rm -f $(PREFIX)/lib/libftp.{a,so,so.3,so.3.1.2}
	rm -f $(PREFIX)/bin/qftp
	rm -r $(PREFIX)/share/doc/ftplib
	
clean:
	rm -f ftplib.o ftplib.os libftp.a libftp.so* qftp ftplib.pc
