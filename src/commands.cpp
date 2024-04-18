/*
 * commands.cpp
 *
 *  Created on: 17.05.2010
 *      Author: dilma
 */

#include "share.h"
#include "commands.h"

const gchar *CMD_NEW = "new";
const gchar *CMD_OPEN = "open";
const gchar *CMD_SAVE = "save";
const gchar *CMD_SAVEAS = "saveas";
const gchar *CMD_PRINT = "print";
const gchar *CMD_REOPEN = "reopen";
const gchar *CMD_EXIT = "exit";
const gchar *CMD_DELETE = "delete";
const gchar *CMD_FREEZ = "freez";
const gchar *CMD_CUT = "cut";
const gchar *CMD_COPY = "copy";
const gchar *CMD_COPY_LINK = "copy_link";
const gchar *CMD_PASTE = "paste";
const gchar *CMD_EDITOR = "editor";
const gchar *CMD_BRINGTOFRONT = "bringtofront";
const gchar *CMD_SENDTOBACK = "sendtoback";
const gchar *CMD_ERASE = "erase";
const gchar *CMD_FORMEDIT = "formedit";
const gchar *CMD_INFO = "info";
const gchar *CMD_PROPERTY = "property";
const gchar *CMD_PROJECTS = "projects";
const gchar *CMD_ELEMENTS = "elements";
const gchar *CMD_NAVIGATE = "navigate";
const gchar *CMD_RUN = "run";
const gchar *CMD_DEBUG = "debug";
const gchar *CMD_TRACE = "trace";
const gchar *CMD_STOP = "stop";
const gchar *CMD_BUILD = "build";
const gchar *CMD_TOOLS = "tools";
const gchar *CMD_CMDEDIT = "cmdedit";
const gchar *CMD_STINFO = "stinfo";
const gchar *CMD_CAPTURE = "capture";
const gchar *CMD_COMPONENTS = "components";
const gchar *CMD_HELP = "help";
const gchar *CMD_FORUM = "forum";
const gchar *CMD_MAIL = "mail";
const gchar *CMD_DMASTER = "dmaster";
const gchar *CMD_ABOUT = "about";
const gchar *CMD_SHA_INI = "sha_ini";
const gchar *CMD_SHA_PAS = "sha_pas";
const gchar *CMD_SHA_SOURCE = "sha_source";
const gchar *CMD_ECREATOR = "ecreator";
const gchar *CMD_WEB_BACK = "web_back";
const gchar *CMD_WEB_FORWARD = "web_forward";
const gchar *CMD_WEB_REFRESH = "web_refresh";
const gchar *CMD_ROOMS = "rooms";
const gchar *CMD_UPLOAD = "upload";
const gchar *CMD_CLOSE = "close";
const gchar *CMD_CLOSEALL = "closeall";
const gchar *CMD_HICHAT = "hichat";
const gchar *CMD_PN_DEBUG = "pn_debug";
const gchar *CMD_PN_HELP = "pn_help";
const gchar *CMD_PN_INFO = "pn_info";
const gchar *CMD_UNDO = "undo";
const gchar *CMD_SEARCH = "search";
const gchar *CMD_GROUP = "group";
const gchar *CMD_UNGROUP = "ungroup";
const gchar *CMD_ALIGN = "align";
const gchar *CMD_COMPILERS = "compilers";
const gchar *CMD_PACK = "pack";
const gchar *CMD_TUTOR = "tutor";
const gchar *CMD_MOVETO = "moveto";
const gchar *CMD_ADDTEMP = "addtemp";
const gchar *CMD_USETEMP = "usetemp";
const gchar *CMD_MEDIA = "media";
const gchar *CMD_ADDPPOINT = "addppoint";
const gchar *CMD_MAKEEXT = "makeext";
const gchar *CMD_HUB_EX = "hub_ex";
const gchar *CMD_BREAK = "break";
const gchar *CMD_DODATA = "dodata";
const gchar *CMD_LINECOLOR = "linecolor";
const gchar *CMD_BACK = "back";
const gchar *CMD_FORWARD = "forward";
const gchar *CMD_PANELS = "panels";
const gchar *CMD_MN_FILE = "mn_file";
const gchar *CMD_MN_EDIT = "mn_edit";
const gchar *CMD_MN_VIEW = "mn_view";
const gchar *CMD_MN_RUN = "mn_run";
const gchar *CMD_MN_SERVICE = "mn_service";
const gchar *CMD_MN_HELP = "mn_help";
const gchar *CMD_CONNECTPOINT = "connectpoint";
const gchar *CMD_REDO = "redo";
const gchar *CMD_ELMOVEUP = "elmoveup";
const gchar *CMD_ELMOVEDOWN = "elmovedown";
const gchar *CMD_DELELEMENT = "delelement";
const gchar *CMD_ADD_GROUP = "add_group";
const gchar *CMD_ADD_TAB = "add_tab";
const gchar *CMD_DEL_TAB = "del_tab";
const gchar *CMD_EXAMPLES = "examples";
const gchar *CMD_MAKELEMENT = "makelement";
const gchar *CMD_TRANSLATE = "translate";
const gchar *CMD_PUBLIC_SHA = "public_sha";
const gchar *CMD_UPDATE_SHA = "update_sha";
const gchar *CMD_LIST_SHA = "list_sha";
const gchar *CMD_CLONE = "clone";
const gchar *CMD_MAKE_WMDOCK = "make_wmdock";
const gchar *CMD_WM_SPLIT = "wm_split";
const gchar *CMD_SELECTALL = "selectall";
const gchar *CMD_PAGEUP = "pageup";
const gchar *CMD_PAGEDOWN = "pagedown";
const gchar *CMD_REPLACETO = "replaceto";
const gchar *CMD_SLIDEDOWN = "slidedown";
const gchar *CMD_SLIDERIGHT = "slideright";
const gchar *CMD_SLIDEDIAG = "slidediag";
const gchar *CMD_SDK_EDITOR = "sdk_editor";
const gchar *CMD_PASTE_DEBUG = "paste_debug";
const gchar *CMD_PASTE_DODATA = "paste_dodata";
const gchar *CMD_PASTE_STRCAT = "paste_strcat";
const gchar *CMD_PASTE_HUB = "paste_hub";
const gchar *CMD_CLEAR_LINK = "clear_link";
const gchar *CMD_RENAME_POINT = "rename_point";
const gchar *CMD_INSERT_POINT = "insert_point";
const gchar *CMD_MOVE_POINT = "move_point";
const gchar *CMD_MAKEHINT = "makehint";
const gchar *CMD_SHOW_LH = "show_lh";
const gchar *CMD_REMOVE_LH = "remove_lh";
const gchar *CMD_QPAN_ADD = "qpan_add";
const gchar *CMD_QPAN_ADDBTN = "qpan_addbtn";
const gchar *CMD_QPAN_SHOW = "qpan_show";
const gchar *CMD_QPAN_SHOWALL = "qpan_showall";
const gchar *CMD_QPAN_HIDEALL = "qpan_hideall";
const gchar *CMD_BIND_RECT = "bind_rect";
const gchar *CMD_BIND_CENTER = "bind_center";
const gchar *CMD_BIND_PADDING = "bind_padding";
const gchar *CMD_DEL_POINT = "del_point";
const gchar *CMD_ZOOMIN = "zoomin";
const gchar *CMD_ZOOMOUT = "zoomout";
const gchar *CMD_PN_ERRORS = "pn_errors";
const gchar *CMD_PAL_FILTER = "pal_filter";
const gchar *CMD_SVN = "svn";
const gchar *CMD_SVN_UPDATE = "svn_update";
const gchar *CMD_SVN_LOG = "svn_log";
const gchar *CMD_SVN_SHOW = "svn_show";
const gchar *CMD_DEBUG_A = "debug_a";
const gchar *CMD_FULLSCREEN = "fullscreen";
const gchar *CMD_PN_REP = "pn_rep";
const gchar *CMD_SAVETOREP = "savetorep";
const gchar *CMD_SEARCHNEXT = "searchnext";
const gchar *CMD_ICONS = "icons";
const gchar *CMD_DECOM_PAL = "decom_pal";
