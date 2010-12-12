AUTOMAKE_OPTIONS = foreign
SUBDIRS = html
ACLOCAL_AMFLAGS = -I m4

lib_LTLIBRARIES = libftp.la
libftp_la_SOURCES = ftplib.c
libftp_la_LD_FLAGS = -version-info @PACKAGE_VERSION@

libftp_ladir = $(datadir)/doc/@PACKAGE@
libftp_la_DATA = ChangeLog INSTALL README README.qftp RFC959.txt

bin_PROGRAMS = qftp
qftp_SOURCES = qftp.c
qftp_LDADD = libftp.la

pkgconfigdir = $(libdir)/pkgconfig
pkgconfig_DATA = ftplib.pc
