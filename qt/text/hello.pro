#
#  Qt qmake file for "Hello world".
#
#  Install the Qt development tools, run "qmake" in the current directory
#  to generate a makefile, then run "make" to build the "hello" binary.
#

TEMPLATE = app
TARGET = hello
DEPENDPATH += .
INCLUDEPATH += .

CONFIG -= app_bundle
QT -= gui

SOURCES += main.cpp
