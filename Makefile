PLUGINDIR=${PREFIX}/lib/collectd
INCLUDEDIR=/usr/include/collectd/ ${EXTRA_INCLUDE}

CFLAGS=-I${INCLUDEDIR} -Wall -Werror -g -O2

all:
	${CC} -DHAVE_CONFIG_H ${CFLAGS} -c sysctl.c  -fPIC -DPIC -o sysctl.o
	${CC} -shared  sysctl.o -Wl,-soname -Wl,sysctl.so -o sysctl.so

clean:
	rm -f sysctl.o sysctl.so

install:
	mkdir -p ${DESTDIR}/${PLUGINDIR}/
	cp sysctl.so ${DESTDIR}/${PLUGINDIR}/
