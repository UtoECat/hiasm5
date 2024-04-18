
#include <gdk/gdktypes.h>
#include </usr/local/include/cairo/cairo.h>

extern cairo_surface_t *xlib_create_surface(GtkWidget *win);

#ifdef OPENGL_SDE
#include <gdk/gdktypes.h>
#include </usr/local/include/cairo/cairo.h>
#include </usr/local/include/cairo/cairo-glitz.h>

extern cairo_surface_t *gl_create_surface(GtkWidget *win);
extern void gl_swap();
#endif
