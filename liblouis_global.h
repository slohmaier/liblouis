#ifndef LIBLOUIS_GLOBAL_H
#define LIBLOUIS_GLOBAL_H

#include <QtCore/qglobal.h>

#if defined(LIBLOUIS_LIBRARY)
#  define LIBLOUIS_EXPORT Q_DECL_EXPORT
#else
#  define LIBLOUIS_EXPORT Q_DECL_IMPORT
#endif

#endif // LIBLOUIS_GLOBAL_H
