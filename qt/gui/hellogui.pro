#
#  Qt qmake file for GUI "Hello world".
#
#  Install the Qt development tools, run "qmake" in the current directory
#  to generate a makefile, then run "make" to build the "hellogui" binary.
#

TEMPLATE = app
TARGET = hellogui
INCLUDEPATH += .
QT += widgets

SOURCES += main.cpp
