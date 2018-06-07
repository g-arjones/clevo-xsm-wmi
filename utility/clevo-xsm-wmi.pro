QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = clevo-xsm-wmi
TEMPLATE = app


SOURCES += main.cpp\
        mainwindow.cpp

HEADERS  += mainwindow.h

FORMS    += mainwindow.ui

INSTALLS += clevo-xsm-wmi clevo-xsm-wmi.service

clevo-xsm-wmi.path = /usr/bin/
clevo-xsm-wmi.files += clevo-xsm-wmi

clevo-xsm-wmi.service.path = /usr/lib/systemd/system/
clevo-xsm-wmi.service.files += systemd/clevo-xsm-wmi.service
