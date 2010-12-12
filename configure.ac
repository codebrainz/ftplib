#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.68])
AC_INIT([ftplib], [3.1.2], [mbrush@leftclick.ca])
AC_CONFIG_SRCDIR([ftplib.c])
AC_CONFIG_HEADERS([config.h])
AC_CONFIG_MACRO_DIR([m4])

AM_INIT_AUTOMAKE
LT_INIT

# Checks for programs.
AC_PROG_CC

# Checks for libraries.

# Checks for header files.
AC_CHECK_HEADERS([arpa/inet.h netdb.h netinet/in.h stdlib.h string.h sys/socket.h sys/time.h unistd.h])

# Checks for typedefs, structures, and compiler characteristics.
AC_TYPE_SIZE_T

# Checks for library functions.
AC_FUNC_MALLOC
AC_CHECK_FUNCS([gethostbyname gethostname getpass memset select socket strchr strdup strerror strstr])

#AC_CONFIG_FILES([Makefile])
AC_OUTPUT([Makefile html/Makefile ftplib.pc])
