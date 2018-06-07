VER := 0.1.1
PREFIX := /usr
DEST := $(PREFIX)/src/clevo-xsm-wmi-$(VER)

install:
	mkdir -p $(DEST)
	cp ../module/clevo-xsm-wmi.c $(DEST)
	cp Makefile.dkms $(DEST)/Makefile
	cp dkms.conf $(DEST)
	/usr/sbin/dkms add clevo-xsm-wmi/$(VER)

uninstall:
	/usr/sbin/dkms remove clevo-xsm-wmi/$(VER) --all
	rm -rf $(DEST)
