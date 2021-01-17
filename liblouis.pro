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
    liblouis/utils.c

HEADERS += \
    liblouis/internal.h \
    liblouis/liblouis.h \
    liblouis/liblouis.h.in \
    liblouis_global.h

# Default rules for deployment.
unix {
    target.path = /usr/lib
}
!isEmpty(target.path): INSTALLS += target

DISTFILES += \
    liblouis/Makefile.am
