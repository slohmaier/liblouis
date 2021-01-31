QMAKE_PROJECT_DEPTH = 0 # force absolute paths

QT -= gui

TEMPLATE = lib
DEFINES += LIBLOUIS_LIBRARY

CONFIG += c++11

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    liblouis/commonTranslationFunctions.c \
    liblouis/compileTranslationTable.c \
    liblouis/logging.c \
    liblouis/lou_backTranslateString.c \
    liblouis/lou_translateString.c \
    liblouis/maketable.c \
    liblouis/metadata.c \
    liblouis/pattern.c \
    liblouis/utils.c \
    tools/gnulib/unistr/u16-mbtoucr.c \
    tools/gnulib/unistr/u32-to-u8.c \
    tools/gnulib/unistr/u8-uctomb.c \
    tools/gnulib/unistr/u16-to-u8.c \
    tools/gnulib/unistr/u8-uctomb-aux.c

HEADERS += \
    liblouis/internal.h \
    liblouis/liblouis.h

win32|win64:HEADERS += windows/include/config.h
else:HEADERS += liblouis/config.h
win32|win64: {
    INCLUDEPATH += windows/include

    unistr_h.target = $$PWD/tools/gnulib/unistr.h
    unistr_h.commands = cp -vf $$PWD/tools/gnulib/unistr.in.h $$PWD/tools/gnulib/unistr.h
    QMAKE_EXTRA_TARGETS += unistr_h
    PRE_TARGETDEPS += $$PWD/tools/gnulib/unistr.h

    unitypes_h.target = $$PWD/tools/gnulib/unitypes.h
    unitypes_h.commands = cp -vf $$PWD/tools/gnulib/unitypes.in.h $$PWD/tools/gnulib/unitypes.h
    QMAKE_EXTRA_TARGETS += unitypes_h
    PRE_TARGETDEPS += $$PWD/tools/gnulib/unitypes.h
    DEFINES += _EXPORTING
}

macx:DEFINES += TABLESDIR=\\\"/usr/local/share/liblouis/tables\\\"

INCLUDEPATH += $$PWD/liblouis $$PWD/tools/gnulib
