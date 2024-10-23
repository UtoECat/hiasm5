/*
 * share.cpp
 *
 *  Created on: 14.05.2010
 *      Author: dilma
 */

#include "share.h"

static gchar _version_[32] = {0};

gchar *HIASM_VERSION() {
	if(!_version_[0])
		sprintf(_version_, "%d.%d.%d",  HIASM_VERSION_MAJOR, HIASM_VERSION_MINOR, HIASM_VERSION_BUILD);
	return _version_;
}

ustring int_to_str(int value) {
	char buf[16];
	sprintf(buf, "%d", value);
	return buf;
}

ustring double_to_str(double value) {
	std::ostringstream s;
	s << value;
	return s.str();
}

char *getTok(char **buf, char tok) {
	if(**buf == '\0')
		return *buf;

	char *s = *buf;
	while(**buf != tok && **buf)
		(*buf)++;
	**buf = '\0';
	(*buf)++;
	return s;
}

const char *dataNames[] = {
	"NULL",
	"Integer",
	"String",
	"Data",
	"List", //Combo
	"StrList", //data_list
	"Icon",
	"Real",
	"Color",
	"Script", //data_script = 9;
	"Stream",
	"Bitmap",
	"Wave",
	"Array", //data_array = 13;
	"ListEx", //combo Ex
	"Font", // font
	"Matrix",  // matrix
	"Jpeg", //jpeg
	"Menu", //menu
	"Code",
	"LinkElement",
	"Flags",
	"StockID",
	"Pixbuf"
};

//-----------------------------------------------------------------------------

Glib::RefPtr<Gdk::Pixbuf> getPointIcon(int type) {
	static const char *names[] = {"sc_func", "sc_event", "sc_var", "sc_prop"};
	static Glib::RefPtr<Gdk::Pixbuf> pIcons[4];

	int i = type - 1;
	if(!pIcons[i])
		pIcons[i] = Gdk::Pixbuf::create_from_file(dataDir + ICONS_PATH + names[i] + ".png");
	return pIcons[i];
}

ustring databaseFile;
ustring dataDir;
ustring homeDir;

void initDirs() {

#ifdef G_OS_WIN32
	dataDir = ustring(g_get_current_dir()) + G_DIR_SEPARATOR_S;
#else
	dataDir = ustring(g_get_current_dir()) + G_DIR_SEPARATOR_S;
#endif

	homeDir = ustring(g_get_home_dir()) + G_DIR_SEPARATOR_S ".hiasm5" G_DIR_SEPARATOR_S;
	if(!file_test(homeDir, FILE_TEST_IS_DIR)) {
		g_mkdir_with_parents(homeDir.c_str(), 0777);
		DEBUG_MSG("Create dir " << homeDir.c_str())
	}
	databaseFile = homeDir + DATABASE_FILE;
	if(!file_test(databaseFile, FILE_TEST_EXISTS)) {
		GFile *f2 = g_file_new_for_path(databaseFile.c_str());
		ustring locDB = dataDir + INT_PATH"" DATABASE_FILE;
		GFile *f1 = g_file_new_for_path(locDB.c_str());
		DEBUG_MSG("Copy " << locDB.c_str() << " to " << databaseFile.c_str())
		g_file_copy(f1, f2, G_FILE_COPY_NONE, NULL, NULL, NULL, NULL);
	}
}

void parseHintName(const ustring &text, ustring &name, ustring &hint) {
	int p = text.find("=");
	if(p == -1) {
		name = text;
		hint = ustring();
	}
	else {
		name = ustring(text, 0, p);
		hint = ustring(text, p + 1);
	}
}

/// HACK: BUGFIX FOR MSYS2 ENVIROMENT
/// Bu some fucking reason, glibmm dll has no ustring::copy() method, wile .a library have it!
/// I have no time deal with this, so this part of it's code will be there, until it's fixed. 
/// (You will know when it's fixed, 'cause linker will throw erroe about duplicated implementation for this symbol - simply comment this out!)
#ifdef G_OS_WIN32

#include <glibmm/ustring.h>

namespace Glib {

class ustring;

// Little helper to make the conversion from gunichar to UTF-8 a one-liner.
//
struct UnicharToUtf8
{
  char buf[6];
  ustring::size_type len;

  explicit UnicharToUtf8(gunichar uc) : len(g_unichar_to_utf8(uc, buf)) {}
};

// All utf8_*_offset() functions return npos if offset is out of range.
// The caller should decide if npos is a valid argument and just marks
// the whole string, or if it is not allowed (e.g. for start positions).
// In the latter case std::out_of_range should be thrown, but usually
// std::string will do that for us.

// First overload: stop on '\0' character.
static ustring::size_type
utf8_byte_offset(const char* str, ustring::size_type offset)
{
  if (offset == ustring::npos)
    return ustring::npos;

  const char* const utf8_skip = g_utf8_skip;
  const char* p = str;

  for (; offset != 0; --offset)
  {
    const unsigned int c = static_cast<unsigned char>(*p);

    if (c == 0)
      return ustring::npos;

    p += utf8_skip[c];
  }

  return (p - str);
}

// Second overload: stop when reaching maxlen.
static ustring::size_type
utf8_byte_offset(const char* str, ustring::size_type offset, ustring::size_type maxlen)
{
  if (offset == ustring::npos)
    return ustring::npos;

  const char* const utf8_skip = g_utf8_skip;
  const char* const pend = str + maxlen;
  const char* p = str;

  for (; offset != 0; --offset)
  {
    if (p >= pend)
      return ustring::npos;

    p += utf8_skip[static_cast<unsigned char>(*p)];
  }

  return (p - str);
}

// Third overload: stop when reaching str.size().
//
inline ustring::size_type
utf8_byte_offset(const std::string& str, ustring::size_type offset)
{
  return utf8_byte_offset(str.data(), offset, str.size());
}

// Takes UTF-8 character offset and count in ci and cn.
// Returns the byte offset and count in i and n.
//
struct Utf8SubstrBounds
{
  ustring::size_type i;
  ustring::size_type n;

  Utf8SubstrBounds(const std::string& str, ustring::size_type ci, ustring::size_type cn)
  : i(utf8_byte_offset(str, ci)), n(ustring::npos)
  {
    if (i != ustring::npos)
      n = utf8_byte_offset(str.data() + i, cn, str.size() - i);
  }
};

// Note that copy() requests UTF-8 character offsets as
// parameters, but returns the number of copied bytes.
//
ustring::size_type
ustring::copy(char* dest, ustring::size_type n, ustring::size_type i) const
{
  const Utf8SubstrBounds bounds(string_, i, n);
  return string_.copy(dest, bounds.n, bounds.i);
}

};

#endif
