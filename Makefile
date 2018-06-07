KVER := $(shell uname -r)
MODDIR := "/lib/modules/$(KVER)/extra"

all: module utility

utility:
	(cd utility && qmake)
	make -C utility

module:
	make -C module

module/clevo-xsm-wmi.ko: module

install: module/clevo-xsm-wmi.c module/clevo-xsm-wmi.ko
	make -C utility install
	make -C dkms install
	systemctl enable clevo-xsm-wmi.service
	mkdir -p $(MODDIR)
	install -m644 module/clevo-xsm-wmi.ko $(MODDIR)
	install -m644 module/misc/clevo-xsm-wmi.conf /etc/modules-load.d/clevo-xsm-wmi.conf
	depmod

clean:
	make -C utility clean
	make -C module clean

uninstall:
	rm -rf $(MODDIR)/clevo-xsm-wmi.ko
	rm -rf /etc/modules-load.d/clevo-xsm-wmi.conf
	rm -rf /etc/clevo-xsm.ini
	systemctl disable clevo-xsm-wmi.service
	make -C utility uninstall
	make -C dkms uninstall

.PHONY: all utility module install clean uninstall
