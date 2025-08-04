// grabkeys.c
#include <X11/Xlib.h>
#include <X11/keysym.h>
#include <X11/Xutil.h>
#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <unistd.h>
#include <string.h>

Display *dpy;
Window win;
Window owin;
int rt;

void cleanup(int sig) {
	XSetInputFocus(dpy, owin, rt, CurrentTime);
	XUngrabKeyboard(dpy, CurrentTime);
	if (win) XDestroyWindow(dpy, win);
	XCloseDisplay(dpy);
	exit(0);
}

int main() {
	printf("><\n");

	dpy = XOpenDisplay(NULL);
	if (!dpy) return 1;

	int screen = DefaultScreen(dpy);
	Window root = RootWindow(dpy, screen);

	XSetWindowAttributes attrs;
	attrs.override_redirect = True;
	attrs.event_mask = KeyPressMask | KeyReleaseMask;

	win = XCreateWindow(
			dpy, root,
			0, 0, 1, 1, 0,
			CopyFromParent, InputOutput, CopyFromParent,
			CWOverrideRedirect | CWEventMask, &attrs
			);

	XMapWindow(dpy, win);
	XFlush(dpy);
	usleep(10000); // small delay to ensure window is mapped

	XGetInputFocus(dpy, &owin, &rt);
	XSetInputFocus(dpy, win, RevertToParent, CurrentTime);

	for (int kc = 8; kc < 255; kc++) {
		XGrabKey(dpy, kc, AnyModifier, win, True, GrabModeAsync, GrabModeAsync);
	}

	XEvent ev;

	char buffer[128];
	memset(buffer, 0, sizeof(buffer));
	size_t i = 0;

	char buffer2[32];
	memset(buffer2, 0, sizeof(buffer2));

	for (;;) {
		XNextEvent(dpy, &ev);
		if (ev.type == KeyPress) {
			KeySym keysym;
			int len = XLookupString(&ev.xkey, buffer2, sizeof(buffer2) - 1, &keysym, NULL);
			char typed = len > 0 ? buffer2[0] : '?';

			if (keysym == XK_Shift_L || keysym == XK_Shift_R ||
					keysym == XK_Control_L || keysym == XK_Control_R ||
					keysym == XK_Alt_L || keysym == XK_Alt_R ||
					keysym == XK_Meta_L || keysym == XK_Meta_R ||
					keysym == XK_Super_L || keysym == XK_Super_R ||
					keysym == XK_Hyper_L || keysym == XK_Hyper_R) {
				continue;
			} else if (keysym == XK_Escape) {
				cleanup(0);
			} else if (keysym == XK_Return) {
				if (i > 0) {
					char* post = " > /dev/null 2>&1 &";
					char buffer3[128 + strlen(post)];
					memset(buffer3, 0, sizeof(buffer3));

					strcpy(buffer3, buffer);
					strcat(buffer3, post);
					system(buffer3);
					cleanup(0);
				}
			} else if (keysym == XK_BackSpace) {
				if (i > 0) i--;
				buffer[i] = '\0';
			} else {
				buffer[i++] = typed;
			}

			printf(">%s<\n", buffer);
			fflush(stdout);
		}
	}
}
