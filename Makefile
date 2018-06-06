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
	install -m644 module/clevo-xsm-wmi.ko $(MODDIR)
	install -m644 module/misc/clevo-xsm-wmi.conf /etc/modules-load.d/clevo-xsm-wmi.conf
	depmod

.PHONY: all utility module install
