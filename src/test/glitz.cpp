/*
 * glitz.cpp
 *
 *  Created on: Nov 27, 2010
 *      Author: dilma
 */

#include "gtkmm/widget.h"
#include <gdk/gdkx.h>
#include <cairo/cairo-xlib.h>

#ifdef OPENGL_SDE
#include <glitz-glx.h>
#include <gdk/gdkx.h>

glitz_drawable_t* drawable;
glitz_surface_t* surface;

cairo_surface_t *gl_create_surface(GtkWidget *win) {
	Display* dsp = GDK_DISPLAY();
	int screen = DefaultScreen(dsp);

	// A template format is specified.
	glitz_drawable_format_t templ;
	templ.samples = 1;
	templ.depth_size = 24;
	templ.doublebuffer = 1;

	// Only the fields specified by this mask will be matched.
	unsigned long format_mask = GLITZ_FORMAT_SAMPLES_MASK | GLITZ_FORMAT_DOUBLEBUFFER_MASK | GLITZ_FORMAT_DEPTH_SIZE_MASK;

	// glitz_glx_find_window_format searches the available formats for one matching the template. The zero in the end specifies
	// which format to use, zero means the first matching. It is possible to iterate over the available formats by increasing
	// this value until NULL is returned.
	glitz_drawable_format_t* dformat = glitz_glx_find_window_format (dsp, screen, format_mask, &templ, 0);
	if (!dformat) {
		fprintf (stderr, "Error: couldn't find window format\n");
		return NULL;
	}

	// As the name implies glitz_glx_get_visual_info_from_format extracts a XVisualInfo from a glitz_drawable_format_t.
	XVisualInfo* vinfo = glitz_glx_get_visual_info_from_format (dsp, screen, dformat);
	if (!vinfo) {
		fprintf (stderr, "Error: no visual info from format\n");
		return NULL;
	}

	// Reference to the root-window.
	//Window root = DefaultRootWindow(dsp);

	/*
	// Creates the colormap
	Colormap cmap = XCreateColormap(dsp, root, vinfo->visual, AllocNone);

	// Window attributes
	XSetWindowAttributes swa;
	swa.colormap = cmap;
	swa.event_mask = ExposureMask;
	unsigned long mask = CWColormap | CWEventMask;

	// Create a window using the earlier found XVisualInfo.
	Window window = XCreateWindow(dsp, root, 0, 0, 800, 600, 0, vinfo->depth, InputOutput, vinfo->visual, mask, &swa);
	XMapWindow(dsp, window);

	// Make it possible to "correctly" close the window.
	Atom wm_delete_window = XInternAtom(dsp, "WM_DELETE_WINDOW", 0);
	XSetWMProtocols(dsp, window, &wm_delete_window, 1);

	XSync(dsp, false);

	// Create the glitz drawable. If this is the first time it is called it will create the opengl context and make it the current.
	drawable = glitz_glx_create_drawable_for_window (dsp, screen, dformat, window, 800, 600);

	XVisualInfo *vinfo = glitz_glx_get_visual_info_from_format (dsp, screen, dformat);
	*/

	GdkWindowAttr attributes;
//	GTK_WIDGET_SET_FLAGS (win, GTK_REALIZED);

	attributes.x = win->allocation.x;
	attributes.y = win->allocation.y;
	attributes.width = 800; //win->allocation.width;
	attributes.height = 600; //win->allocation.height;
	attributes.wclass = GDK_INPUT_OUTPUT;
	attributes.window_type = GDK_WINDOW_CHILD;
	attributes.event_mask = gtk_widget_get_events (win) | GDK_EXPOSURE_MASK;
	attributes.visual = gtk_widget_get_visual (win);
	attributes.visual = gdkx_visual_get (vinfo->visualid);
	attributes.colormap = gdk_colormap_new (attributes.visual, TRUE);

	gint attributes_mask =
	  GDK_WA_X | GDK_WA_Y | GDK_WA_VISUAL | GDK_WA_COLORMAP;

	GdkWindow *parent = gtk_widget_get_parent_window (win);
//	win->window = gdk_window_new(parent, &attributes, attributes_mask);

	drawable =
	  glitz_glx_create_drawable_for_window (dsp, screen,
											dformat, gdk_x11_drawable_get_xid(win->window),
											attributes.width,
											attributes.height);

	// A glitz_format_t must be used when creating a surface. Not that this is not the same format as glitz_drawable_format_t used earlier.
	// Similar to before a template is created and a matching format is searched for.
	glitz_format_t *format;
	glitz_drawable_buffer_t buffer;

	format = glitz_find_standard_format (drawable,GLITZ_STANDARD_ARGB32);

	if (!format) {
		fprintf (stderr, "Error: couldn't find surface format\n");
	}

	// Create a surface with above format.
	surface = glitz_surface_create (drawable, format, attributes.width, 600, attributes.height, NULL);
	if (!surface) {
		fprintf (stderr, "Error: couldn't create glitz surface\n");
	}

	// The surface buffer must be bound to the drawable. The surface buffer is the buffer which rendering
	// calls is made to. If a doublebuffered surface is selected the backbuffer will used.
	if (dformat->doublebuffer) {
		buffer = GLITZ_DRAWABLE_BUFFER_BACK_COLOR;
	} else {
		buffer = GLITZ_DRAWABLE_BUFFER_FRONT_COLOR;
	}

	// Bind the surface buffer to the drawable.
	glitz_surface_attach (surface, drawable, buffer);

	gtk_style_attach (win->style, win->window);
	gtk_style_set_background (win->style, win->window, GTK_STATE_NORMAL);
	gdk_window_set_user_data (win->window, win);

	return cairo_glitz_surface_create(surface);
}

void gl_swap() {
	glitz_surface_flush(surface);
	glitz_drawable_swap_buffers(drawable);
}
#endif

cairo_surface_t *xlib_create_surface(GtkWidget *win) {
	Display* dsp = GDK_DISPLAY();
	int screen = DefaultScreen(dsp);

	cairo_surface_t *xlib_surf = cairo_xlib_surface_create(dsp, gdk_x11_drawable_get_xid(win->window), DefaultVisual(dsp, 0), 800, 600);

	return xlib_surf;
}
