##
##  Makefile -- Build procedure for sample ward Apache module
##  Autogenerated via ``apxs -n ward -g''.
##

builddir=.
top_srcdir=/etc/httpd
top_builddir=/usr/lib64/httpd
include /usr/lib64/httpd/build/special.mk

#   the used tools
APXS=apxs
APACHECTL=apachectl

#   additional defines, includes and libraries
#DEFS=-Dmy_define=my_value
#INCLUDES=-Imy/include/dir
#LIBS=-Lmy/lib/dir -lmylib

#   the default target
all: local-shared-build

#   install the shared object file into Apache 
install: install-modules-yes

#   cleanup
clean:
	-rm -f mod_ward.o mod_ward.lo mod_ward.slo mod_ward.la 

#   simple test
test: reload
	lynx -mime_header http://localhost/ward

#   install and activate shared object by reloading Apache to
#   force a reload of the shared object file
reload: install restart

#   the general Apache start/restart/stop
#   procedures
start:
	$(APACHECTL) start
restart:
	$(APACHECTL) restart
stop:
	$(APACHECTL) stop

