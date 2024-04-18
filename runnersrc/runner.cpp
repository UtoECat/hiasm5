//============================================================================
// Name        : test.cpp
// Author      : Dilma
// Version     :
// Copyright   : HiAsm Studio 5 (C), 2003-2010
// Description : Primary file
//============================================================================

#include <iostream>

#include <gtkmm.h>
#include <glibmm.h>
#include "Pack.h"

#include "SDK.h"
#include "Elements.h"
#include "MainDataBase.h"

using namespace std;
using namespace Gtk;

int main(int argc, char** argv) {
	Main kit(argc, argv);

	initDirs();

	DEBUG_MSG("open hiasm.db...")
	mdb.open();
	DEBUG_MSG("load PackCollection...")
	packSet = new PackCollection();

	DEBUG_MSG("run spheme...")
	MSDK *sdk = new MSDK();
	gchar *cont, *scont;
	gsize len;
	g_file_get_contents(argv[0], &cont, &len, NULL);
	DEBUG_MSG("read len " << len)
	scont = cont;
	while(strncmp(cont, (ustring("Make") + ustring("(_base)")).c_str(), 11) != 0)
		cont++;
	DEBUG_MSG("Length " << strlen(cont) << " : " << (int)(cont - scont))
	int line = 1;
	sdk->loadFromText(cont, line);
	g_free(scont);
	sdk->run();

	Window *form = NULL;
	for(ElementsList::iterator e = sdk->elements.begin(); e != sdk->elements.end(); e++)
		if((*e)->tpl->name == "hcTplForm") {
			form = dynamic_cast<ElementTplForm*>(*e)->getForm();
			break;
		}
	form->set_position(WIN_POS_CENTER);
	form->hide();

	g_signal_connect(form->gobj(), "destroy", G_CALLBACK (gtk_main_quit), NULL);

	Main::run(*form);

	return (0);
}
