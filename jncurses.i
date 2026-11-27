%module Jncurses
%{
#define _XOPEN_SOURCE_EXTENDED 1
#include <ncursesw/curses.h>
#include <ncursesw/term.h>
#include <ncursesw/panel.h>
#include <ncursesw/menu.h>
#include <ncursesw/form.h>
%}

/* this is for handling pointers */

%include "typemaps.i"
%include "various.i"

%pragma(java) jniclasscode=%{
static {
System.loadLibrary("jncurses");
}
%}
%pragma(java) moduleclassmodifiers=%{
// this is a comment 
public class
%}

/* documentation */

/* this is an attempt to add some documentation to specific
elements of the generated code */

/* this is for a method */

%javamethodmodifiers clear() "
/**
 * Calling this method will make you mad.
 * Use with <b>utmost</b> caution. 
 * 0123456789
 */
public";

/* this is again for a module */
%typemap(javaimports) Jncurses "
	0123456789";

/* ncurses stuff */
/* ============= */

/* initscr */
WINDOW *initscr(void);
int endwin(void);
bool isendwin(void);
SCREEN *newterm(char *type, FILE *outfd, FILE *infd);
SCREEN *set_term(SCREEN *new);
void delscreen(SCREEN* sp);

/* attr */
int attroff(int attrs);
int wattroff(WINDOW *win, int attrs);
int attron(int attrs);
int wattron(WINDOW *win, int attrs);
int attrset(int attrs);
int wattrset(WINDOW *win, int attrs);
int color_set(short color_pair_number, void* opts);
int wcolor_set(WINDOW *win, short color_pair_number, void* opts);
int standend(void);
int wstandend(WINDOW *win);
int standout(void);
int wstandout(WINDOW *win);
int attr_get(attr_t *attrs, short *pair, void *opts);
int wattr_get(WINDOW *win, attr_t *attrs, short *pair, void *opts);
int attr_off(attr_t attrs, void *opts);
int wattr_off(WINDOW *win, attr_t attrs, void *opts);
int attr_on(attr_t attrs, void *opts);
int wattr_on(WINDOW *win, attr_t attrs, void *opts);
int attr_set(attr_t attrs, short pair, void *opts);
int wattr_set(WINDOW *win, attr_t attrs, short pair, void *opts);
int chgat(int n, attr_t attr, short color, const void *opts);
int wchgat(WINDOW *win, int n, attr_t attr, short color, const void *opts);
int mvchgat(int y, int x, int n, attr_t attr, short color, const void *opts);
int mvwchgat(WINDOW *win, int y, int x, int n, attr_t attr, short color, const void *opts);

/* outopts */
int clearok(WINDOW *win, bool bf);
int idlok(WINDOW *win, bool bf);
void idcok(WINDOW *win, bool bf);
void immedok(WINDOW *win, bool bf);
int leaveok(WINDOW *win, bool bf);
int setscrreg(int top, int bot);
int wsetscrreg(WINDOW *win, int top, int bot);
int scrollok(WINDOW *win, bool bf);
int nl(void);
int nonl(void);

/* inopts */
int cbreak(void);
int nocbreak(void);
int echo(void);
int noecho(void);
int halfdelay(int tenths);
int intrflush(WINDOW *win, bool bf);
int keypad(WINDOW *win, bool bf);
int meta(WINDOW *win, bool bf);
int nodelay(WINDOW *win, bool bf);
int raw(void);
int noraw(void);
void noqiflush(void);
void qiflush(void);
int notimeout(WINDOW *win, bool bf);
void timeout(int delay);
void wtimeout(WINDOW *win, int delay);
int typeahead(int fd);

/* inch */
chtype inch(void);
chtype winch(WINDOW *win);
chtype mvinch(int y, int x);
chtype mvwinch(WINDOW *win, int y, int x);

/* color */
int start_color(void);
int init_pair(short pair, short f, short b);
int init_color(short color, short r, short g, short b);
bool has_colors(void);
bool can_change_color(void);
int color_content(short color, short *r, short *g, short *b);
int pair_content(short pair, short *f, short *b);

/* trace */
/*
It seems these are not available on most systems
since ncurses is compiled without trace support
on most systems (this is the standard production
way to supply ncurses on running systems). 

Enable this section only if you have ncurses which
was compiled with tracing enabled (#define TRACE).
*/
/*
void _tracef(const char *format, ...);
void _tracedump(const char *label, WINDOW *win);
char *_traceattr(attr_t attr);
char *_traceattr2(int buffer, chtype ch);
char *_nc_tracebits(void);
char *_tracechar(int);
char *_tracechtype(chtype ch);
char *_tracechtype2(int buffer, chtype ch);
char *_tracemouse(const MEVENT *event);
void trace(const unsigned int param);
*/

/* add_wch */
int add_wch( const cchar_t *wch );
int wadd_wch( WINDOW *win, const cchar_t *wch );
int mvadd_wch( int y, int x, const cchar_t *wch );
int mvwadd_wch( WINDOW *win, int y, int x, const cchar_t *wch );
int echo_wchar( const cchar_t *wch );
int wecho_wchar( WINDOW *win, const cchar_t *wch );

/* addch */
int addch(const chtype ch);
int waddch(WINDOW *win, const chtype ch);
int mvaddch(int y, int x, const chtype ch);
int mvwaddch(WINDOW *win, int y, int x, const chtype ch);
int echochar(const chtype ch);
int wechochar(WINDOW *win, const chtype ch);

/* addchstr */
int addchstr(const chtype *chstr);
int addchnstr(const chtype *chstr, int n);
int waddchstr(WINDOW *win, const chtype *chstr);
int waddchnstr(WINDOW *win, const chtype *chstr, int n);
int mvaddchstr(int y, int x, const chtype *chstr);
int mvaddchnstr(int y, int x, const chtype *chstr, int n);
int mvwaddchstr(WINDOW *win, int y, int x, const chtype *chstr);
int mvwaddchnstr(WINDOW *win, int y, int x, const chtype *chstr, int n);

/* addstr */
int addstr(const char *str);
int addnstr(const char *str, int n);
int waddstr(WINDOW *win, const char *str);
int waddnstr(WINDOW *win, const char *str, int n);
int mvaddstr(int y, int x, const char *str);
int mvaddnstr(int y, int x, const char *str, int n);
int mvwaddstr(WINDOW *win, int y, int x, const char *str);
int mvwaddnstr(WINDOW *win, int y, int x, const char *str, int n);

/* add_wchstr */
int add_wchstr(const cchar_t *wchstr);
int add_wchnstr(const cchar_t *wchstr, int n);
int wadd_wchstr(WINDOW * win, const cchar_t *wchstr);
int wadd_wchnstr(WINDOW * win, const cchar_t *wchstr, int n);
int mvadd_wchstr(int y, int x, const cchar_t *wchstr);
int mvadd_wchnstr(int y, int x, const cchar_t *wchstr, int n);
int mvwadd_wchstr(WINDOW *win, int y, int x, const cchar_t *wchstr);
int mvwadd_wchnstr(WINDOW *win, int y, int x, const cchar_t *wchstr, int n);

/* addwstr */
int addwstr(const wchar_t *wstr);
int addnwstr(const wchar_t *wstr, int n);
int waddwstr(WINDOW *win, const wchar_t *wstr);
int waddnwstr(WINDOW *win, const wchar_t *wstr, int n);
int mvaddwstr(int y, int x, const wchar_t *wstr);
int mvaddnwstr(int y, int x, const wchar_t *wstr, int n);
int mvwaddwstr(WINDOW *win, int y, int x, const wchar_t *wstr);
int mvwaddnwstr(WINDOW *win, int y, int x, const wchar_t *wstr, int n);

/* default_colors */
int use_default_colors(void);
int assume_default_colors(int fg, int bg);

/* termatters */
int baudrate(void);
char erasechar(void);
int erasewchar(wchar_t *ch);
bool has_ic(void);
bool has_il(void);
char killchar(void);
int killwchar(wchar_t *ch);
char *longname(void);
attr_t term_attrs(void);
chtype termattrs(void);
char *termname(void);

/* beep */
int beep(void);
int flash(void);

/* bkgd */
void bkgdset(chtype ch);
void wbkgdset(WINDOW *win, chtype ch);
int bkgd(chtype ch);
int wbkgd(WINDOW *win, chtype ch);
chtype getbkgd(WINDOW *win);

/* pad */
WINDOW *newpad(int nlines, int ncols);
WINDOW *subpad(WINDOW *orig, int nlines, int ncols,
int begin_y, int begin_x);
int prefresh(WINDOW *pad, int pminrow, int pmincol,
int sminrow, int smincol, int smaxrow, int smaxcol);
int pnoutrefresh(WINDOW *pad, int pminrow, int pmincol,
int sminrow, int smincol, int smaxrow, int smaxcol);
int pechochar(WINDOW *pad, chtype ch);
int pecho_wchar(WINDOW *pad, const cchar_t *wch);

/* bkgrnd */
int bkgrnd( const cchar_t *wch);
int wbkgrnd( WINDOW *win, const cchar_t *wch);
void bkgrndset(const cchar_t *wch );
void wbkgrndset(WINDOW *win, const cchar_t *wch);
int getbkgrnd(cchar_t *wch);
int wgetbkgrnd(WINDOW *win, cchar_t *wch);

/* border */
int border(chtype ls, chtype rs, chtype ts, chtype bs, chtype tl, chtype tr, chtype bl, chtype br);
int wborder(WINDOW *win, chtype ls, chtype rs, chtype ts, chtype bs, chtype tl, chtype tr, chtype bl, chtype br);
int box(WINDOW *win, chtype verch, chtype horch);
int hline(chtype ch, int n);
int whline(WINDOW *win, chtype ch, int n);
int vline(chtype ch, int n);
int wvline(WINDOW *win, chtype ch, int n);
int mvhline(int y, int x, chtype ch, int n);
int mvwhline(WINDOW *, int y, int x, chtype ch, int n);
int mvvline(int y, int x, chtype ch, int n);
int mvwvline(WINDOW *, int y, int x, chtype ch, int n);

/* border_set */
int border_set( const cchar_t *ls, const cchar_t *rs, const cchar_t *ts, const cchar_t *bs, const cchar_t *tl, const cchar_t *tr, const cchar_t *bl, const cchar_t *br );
int wborder_set( WINDOW *win, const cchar_t *ls, const cchar_t *rs, const cchar_t *ts, const cchar_t *bs, const cchar_t *tl, const cchar_t *tr, const cchar_t *bl, const cchar_t *br);
int box_set( WINDOW *win, const cchar_t *verch, const cchar_t *horch);
int hline_set( const cchar_t *wch, int n);
int whline_set( WINDOW *win, const cchar_t *wch, int n);
int mvhline_set( int y, int x, const cchar_t *wch, int n);
int mvwhline_set( WINDOW *win, int y, int x, const cchar_t *wch, int n);
int vline_set( const cchar_t *wch, int n);
int wvline_set( WINDOW *win, const cchar_t *wch, int n);
int mvvline_set( int y, int x, const cchar_t *wch, int n);
int mvwvline_set( WINDOW *win, int y, int x, const cchar_t *wch, int n);

/* clear */
int erase(void);
int werase(WINDOW *win);
int clear(void);
int wclear(WINDOW *win);
int clrtobot(void);
int wclrtobot(WINDOW *win);
int clrtoeol(void);
int wclrtoeol(WINDOW *win);

/* overlay */
int overlay(const WINDOW *srcwin, WINDOW *dstwin);
int overwrite(const WINDOW *srcwin, WINDOW *dstwin);
int copywin(const WINDOW *srcwin, WINDOW *dstwin, int sminrow, int smincol, int dminrow, int dmincol, int dmaxrow, int dmaxcol, int overlay);

/* kernel */
int def_prog_mode(void);
int def_shell_mode(void);
int reset_prog_mode(void);
int reset_shell_mode(void);
int resetty(void);
int savetty(void);
/* These are macros that assign to their arguments. The wrapper passes them
   locals it never reads back, which gcc reports: the warning is off for
   these wrappers only. */
%insert("wrapper") %{
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wunused-but-set-variable"
%}
void getsyx(int y, int x);
%insert("wrapper") %{
#pragma GCC diagnostic pop
%}
void setsyx(int y, int x);
int ripoffline(int line, int (*init)(WINDOW *, int));
int curs_set(int visibility);
int napms(int ms);

/* extensions */
const char * curses_version(void);
int use_extended_names(bool enable);

/* define_key */
int define_key(const char *definition, int keycode);

/* terminfo */
int setupterm(char *term, int fildes, int *errret);
int setterm(char *term);
TERMINAL *set_curterm(TERMINAL *nterm);
int del_curterm(TERMINAL *oterm);
int restartterm(char *term, int fildes, int *errret);
char *tparm(char *str, ...);
int tputs(const char *str, int affcnt, int (*putc)(int));
int putp(const char *str);
int vidputs(chtype attrs, int (*putc)(int));
int vidattr(chtype attrs);
int vid_puts(attr_t attrs, short pair, void *opts, int (*putc)(int));
int vid_attr(attr_t attrs, short pair, void *opts);
int mvcur(int oldrow, int oldcol, int newrow, int newcol);
int tigetflag(char *capname);
int tigetnum(char *capname);
char *tigetstr(char *capname);

/* util */
char *unctrl(chtype c);
wchar_t *wunctrl(cchar_t *c);
char *keyname(int c);
char *key_name(wchar_t w);
void filter(void);
void nofilter(void);
void use_env(bool f);
int putwin(WINDOW *win, FILE *filep);
WINDOW *getwin(FILE *filep);
int delay_output(int ms);
int flushinp(void);

/* delch */
int delch(void);
int wdelch(WINDOW *win);
int mvdelch(int y, int x);
int mvwdelch(WINDOW *win, int y, int x);

/* deleteln */
int deleteln(void);
int wdeleteln(WINDOW *win);
int insdelln(int n);
int winsdelln(WINDOW *win, int n);
int insertln(void);
int winsertln(WINDOW *win);

/* window */
WINDOW *newwin(int nlines, int ncols, int begin_y, int begin_x);
int delwin(WINDOW *win);
int mvwin(WINDOW *win, int y, int x);
WINDOW *subwin(WINDOW *orig, int nlines, int ncols, int begin_y, int begin_x);
WINDOW *derwin(WINDOW *orig, int nlines, int ncols, int begin_y, int begin_x);
int mvderwin(WINDOW *win, int par_y, int par_x);
WINDOW *dupwin(WINDOW *win);
void wsyncup(WINDOW *win);
int syncok(WINDOW *win, bool bf);
void wcursyncup(WINDOW *win);
void wsyncdown(WINDOW *win);

/* refresh */
int refresh(void);
int wrefresh(WINDOW *win);
int wnoutrefresh(WINDOW *win);
int doupdate(void);
int redrawwin(WINDOW *win);
int wredrawln(WINDOW *win, int beg_line, int num_lines);

/* get_wch */
int get_wch(wint_t *wch);
int wget_wch(WINDOW *win, wint_t *wch);
int mvget_wch(int y, int x, wint_t *wch);
int mvwget_wch(WINDOW *win, int y, int x, wint_t *wch);
int unget_wch(const wchar_t wch);

/* get_wstr */
int get_wstr(wint_t *wstr);
int getn_wstr(wint_t *wstr, int n);
int wget_wstr(WINDOW *win, wint_t *wstr);
int wgetn_wstr(WINDOW *win, wint_t *wstr, int n);
int mvget_wstr(int y, int x, wint_t *wstr);
int mvgetn_wstr(int y, int x, wint_t *wstr, int n);
int mvwget_wstr(WINDOW *win, int y, int x, wint_t *wstr);
int mvwgetn_wstr(WINDOW *win, int y, int x, wint_t *wstr, int n);

/* legacy */
int getbegx(WINDOW *win);
int getbegy(WINDOW *win);
int getcurx(WINDOW *win);
int getcury(WINDOW *win);
int getmaxx(WINDOW *win);
int getmaxy(WINDOW *win);
int getparx(WINDOW *win);
int getpary(WINDOW *win);

/* getyx */
/* These are macros that assign to their arguments. The wrapper passes them
   locals it never reads back, which gcc reports: the warning is off for
   these wrappers only. */
%insert("wrapper") %{
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wunused-but-set-variable"
%}
void getyx(WINDOW *win, int y, int x);
void getparyx(WINDOW *win, int y, int x);
void getbegyx(WINDOW *win, int y, int x);
void getmaxyx(WINDOW *win, int y, int x);
%insert("wrapper") %{
#pragma GCC diagnostic pop
%}

/* getcchar */
int getcchar( const cchar_t *wcval, wchar_t *wch, attr_t *attrs, short *color_pair, void *opts );
int setcchar( cchar_t *wcval, const wchar_t *wch, const attr_t attrs, short color_pair, void *opts );

/* getch */
int getch(void);
int wgetch(WINDOW *win);
int mvgetch(int y, int x);
int mvwgetch(WINDOW *win, int y, int x);
int ungetch(int ch);
int has_key(int ch);

/* mouse */
int getmouse(MEVENT *event);
int ungetmouse(MEVENT *event);
mmask_t mousemask(mmask_t newmask, mmask_t *oldmask);
bool wenclose(const WINDOW *win, int y, int x);
bool mouse_trafo(int* pY, int* pX, bool to_screen);
bool wmouse_trafo(const WINDOW* win, int* pY, int* pX,
bool to_screen);
int mouseinterval(int erval);

/* getstr */ 
int getstr(char *str);
int getnstr(char *str, int n);
int wgetstr(WINDOW *win, char *str);
int wgetnstr(WINDOW *win, char *str, int n);
int mvgetstr(int y, int x, char *str);
int mvwgetstr(WINDOW *win, int y, int x, char *str);
int mvgetnstr(int y, int x, char *str, int n);
int mvwgetnstr(WINDOW *, int y, int x, char *str, int n);

/* in_wch */
int in_wch(cchar_t *wcval);
int mvin_wch(int y, int x, cchar_t *wcval);
int mvwin_wch(WINDOW *win, int y, int x, cchar_t *wcval);
int win_wch(WINDOW *win, cchar_t *wcval);

/* in_wchstr */
int in_wchstr(cchar_t *wchstr);
int in_wchnstr(cchar_t *wchstr, int n);
int win_wchstr(WINDOW *win, cchar_t *wchstr);
int win_wchnstr(WINDOW *win, cchar_t *wchstr, int n);
int mvin_wchstr(int y, int x, cchar_t *wchstr);
int mvin_wchnstr(int y, int x, cchar_t *wchstr, int n);
int mvwin_wchstr(WINDOW *win, int y, int x, cchar_t *wchstr);
int mvwin_wchnstr(WINDOW *win, int y, int x, cchar_t *wchstr, int n);

/* inchstr */
int inchstr(chtype *chstr);
int inchnstr(chtype *chstr, int n);
int winchstr(WINDOW *win, chtype *chstr);
int winchnstr(WINDOW *win, chtype *chstr, int n);
int mvinchstr(int y, int x, chtype *chstr);
int mvinchnstr(int y, int x, chtype *chstr, int n);
int mvwinchstr(WINDOW *win, int y, int x, chtype *chstr);
int mvwinchnstr(WINDOW *win, int y, int x, chtype *chstr, int n);

/* instr */
int instr(char *str);
int innstr(char *str, int n);
int winstr(WINDOW *win, char *str);
int winnstr(WINDOW *win, char *str, int n);
int mvinstr(int y, int x, char *str);
int mvinnstr(int y, int x, char *str, int n);
int mvwinstr(WINDOW *win, int y, int x, char *str);
int mvwinnstr(WINDOW *win, int y, int x, char *str, int n);

/* inwstr */
int inwstr(wchar_t *str);
int innwstr(wchar_t *str, int n);
int winwstr(WINDOW *win, wchar_t *str);
int winnwstr(WINDOW *win, wchar_t *str, int n);
int mvinwstr(int y, int x, wchar_t *str);
int mvinnwstr(int y, int x, wchar_t *str, int n);
int mvwinwstr(WINDOW *win, int y, int x, wchar_t *str);
int mvwinnwstr(WINDOW *win, int y, int x, wchar_t *str, int n);

/* opaque */
bool is_cleared(const WINDOW *win);
bool is_idcok(const WINDOW *win);
bool is_idlok(const WINDOW *win);
bool is_immedok(const WINDOW *win);
bool is_keypad(const WINDOW *win);
bool is_leaveok(const WINDOW *win);
bool is_nodelay(const WINDOW *win);
bool is_notimeout(const WINDOW *win);
bool is_scrollok(const WINDOW *win);
bool is_syncok(const WINDOW *win);
WINDOW * wgetparent (const WINDOW *win);
int wgetscrreg (const WINDOW *win, int *top, int *bottom);

/* touch */
int touchwin(WINDOW *win);
int touchline(WINDOW *win, int start, int count);
int untouchwin(WINDOW *win);
int wtouchln(WINDOW *win, int y, int n, int changed);
bool is_linetouched(WINDOW *win, int line);
bool is_wintouched(WINDOW *win);
/* key_defined */
int key_defined(const char *definition);
/* resizeterm */
bool is_term_resized(int lines, int columns);
int resize_term(int lines, int columns);
int resizeterm(int lines, int columns);
/* keybound */
char * keybound(int keycode, int count);
/* keyok */
int keyok(int keycode, bool enable);
/* move */
int move(int y, int x);
int wmove(WINDOW *win, int y, int x);
/* printw */
int printw(const char *fmt, ...);
int wprintw(WINDOW *win, const char *fmt, ...);
int mvprintw(int y, int x, const char *fmt, ...);
int mvwprintw(WINDOW *win, int y, int x, const char *fmt, ...);
//int vwprintw(WINDOW *win, const char *fmt, va_list varglist);
//int vw_printw(WINDOW *win, const char *fmt, va_list varglist);
/* scanw */
int scanw(char *fmt, ...);
int wscanw(WINDOW *win, char *fmt, ...);
int mvscanw(int y, int x, char *fmt, ...);
int mvwscanw(WINDOW *win, int y, int x, char *fmt, ...);
//int vw_scanw(WINDOW *win, char *fmt, va_list varglist);
//int vwscanw(WINDOW *win, char *fmt, va_list varglist);
/* scr_dump */
int scr_dump(const char *filename);
int scr_restore(const char *filename);
int scr_init(const char *filename);
int scr_set(const char *filename);
/* scroll */
int scroll(WINDOW *win);
int scrl(int n);
int wscrl(WINDOW *win, int n);
/* slk */
int slk_init(int fmt);
int slk_set(int labnum, const char *label, int fmt);
int slk_refresh(void);
int slk_noutrefresh(void);
char *slk_label(int labnum);
int slk_clear(void);
int slk_restore(void);
int slk_touch(void);
int slk_attron(const chtype attrs);
int slk_attroff(const chtype attrs);
int slk_attrset(const chtype attrs);
int slk_attr_on(attr_t attrs, void* opts);
int slk_attr_off(const attr_t attrs, void * opts);
int slk_attr_set(const attr_t attrs,
short color_pair_number, void* opts);
attr_t slk_attr(void);
int slk_color(short color_pair_number);
/* termcap */

%inline %{
extern char PC;
extern char * UP;
extern char * BC;
extern short ospeed;
%}

int tgetent(char *bp, const char *name);
int tgetflag(char *id);
int tgetnum(char *id);
char *tgetstr(char *id, char **area);
char *tgoto(const char *cap, int col, int row);
/* This function was already defined earlier */
/* int tputs(const char *str, int affcnt, int (*putc)(int)); */

/* legacy_coding */
int use_legacy_coding(int level);

/* insstr */
int insstr(const char *str);
int insnstr(const char *str, int n);
int winsstr(WINDOW *win, const char *str);
int winsnstr(WINDOW *win, const char *str, int n);
int mvinsstr(int y, int x, const char *str);
int mvinsnstr(int y, int x, const char *str, int n);
int mvwinsstr(WINDOW *win, int y, int x, const char *str);
int mvwinsnstr(WINDOW *win, int y, int x, const char *str, int n);

/* panel stuff */
/* =========== */
/* panel */
PANEL *new_panel(WINDOW *win);
int bottom_panel(PANEL *pan);
int top_panel(PANEL *pan);
int show_panel(PANEL *pan);
void update_panels();
int hide_panel(PANEL *pan);
WINDOW *panel_window(const PANEL *pan);
int replace_panel(PANEL *pan, WINDOW *window);
int move_panel(PANEL *pan, int starty, int startx);
int panel_hidden(const PANEL *pan);
PANEL *panel_above(const PANEL *pan);
PANEL *panel_below(const PANEL *pan);
int set_panel_userptr(PANEL *pan, const void *ptr);
const void *panel_userptr(const PANEL *pan);
int del_panel(PANEL *pan);

/* menu stuff */
/* ========== */

/* menu_current */
int set_current_item(MENU *menu,ITEM *item);
ITEM *current_item(const MENU *menu);
int set_top_row(MENU *menu, int row);
int top_row(const MENU *menu);
int item_index(const ITEM *item);
/* menu_new */
ITEM *new_item(const char *name, const char *description);
int free_item(ITEM *item);
/* new */
MENU *new_menu(ITEM **items);
int free_menu(MENU *menu);
/* items */
int set_menu_items(MENU *menu, ITEM **items);
ITEM **menu_items(const MENU *menu);
int item_count(const MENU *menu);
/* menu_name */
const char *item_name(const ITEM *item);
const char *item_description(const ITEM *item);
/* hook */
int set_item_init(MENU *menu, Menu_Hook func);
Menu_Hook item_init(const MENU *menu);
int set_item_term(MENU *menu, Menu_Hook func);
Menu_Hook item_term(const MENU *menu);
int set_menu_init(MENU *menu, Menu_Hook func);
Menu_Hook menu_init(const MENU *menu);
int set_menu_term(MENU *menu, Menu_Hook func);
Menu_Hook menu_term(const MENU *menu);
/* menu_opts */
int set_item_opts(ITEM *item, Item_Options opts);
int item_opts_on(ITEM *item, Item_Options opts);
int item_opts_off(ITEM *item, Item_Options opts);
Item_Options item_opts(const ITEM *item);
/* menu_userptr */
int set_item_userptr(ITEM *item, void *userptr);
void *item_userptr(const ITEM *item);
/* menu_value */
int set_item_value(ITEM *item, bool value);
bool item_value(const ITEM *item);
/* menu_visible */
bool item_visible(const ITEM *item);
/* attributes */
int set_menu_fore(MENU *menu, chtype attr);
chtype menu_fore(const MENU *menu);
int set_menu_back(MENU *menu, chtype attr);
chtype menu_back(const MENU *menu);
int set_menu_grey(MENU *menu, chtype attr);
chtype menu_grey(const MENU *menu);
int set_menu_pad(MENU *menu, int pad);
int menu_pad(const MENU *menu);
/* driver */
int menu_driver(MENU *menu, int c);
/* format */
int set_menu_format(MENU *menu, int rows, int cols);
void menu_format(const MENU *menu, int *rows, int *cols);
/* mark */
int set_menu_mark(MENU *menu, const char *mark);
const char *menu_mark(const MENU *menu);
/* opts */
int set_menu_opts(MENU *menu, Menu_Options opts);
int menu_opts_on(MENU *menu, Menu_Options opts);
int menu_opts_off(MENU *menu, Menu_Options opts);
Menu_Options menu_opts(const MENU *menu);
/* pattern */
int set_menu_pattern(MENU *menu, const char *pattern);
char *menu_pattern(const MENU *menu);
/* requestname */
const char *menu_request_name(int request);
int menu_request_by_name(const char *name);
/* spacing */
int set_menu_spacing(MENU *menu, int spc_description, int spc_rows, int spc_columns);
int menu_spacing(const MENU *menu, int* spc_description, int* spc_rows, int* spc_columns);
/* win */
int set_menu_win(MENU *menu, WINDOW *win);
WINDOW *menu_win(const MENU *menu);
int set_menu_sub(MENU *menu, WINDOW *sub);
WINDOW *menu_sub(const MENU *menu);
int scale_menu(const MENU *menu, int *rows, int *columns);
/* post */
int post_menu(MENU *menu);
int unpost_menu(MENU *menu);
/* userptr */
int set_menu_userptr(MENU *menu, void *userptr);
void *menu_userptr(const MENU *menu);
/* cursor */
int pos_menu_cursor(const MENU *menu);

/* form stuff */
/* ========== */

/* page */
int set_current_field(FORM *form, FIELD *field);
FIELD *current_field(const FORM *);
int set_form_page(FORM *form, int n);
int form_page(const FORM *form);
int field_index(const FIELD *field);
/* data */
bool data_ahead(const FORM *form);
bool data_behind(const FORM *form);
/* field_new */
FIELD *new_field(int height, int width, int toprow, int leftcol, int offscreen, int nbuffers);
FIELD *dup_field(FIELD *field, int toprow, int leftcol);
FIELD *link_field(FIELD *field, int toprow, int leftcol);
int free_field(FIELD *field);
/* field_info */
int field_info(const FIELD *field, int *rows, int *cols, int *frow, int *fcol, int *nrow, int *nbuf);
int dynamic_field_info(const FIELD *field, int *rows, int *cols, int *max);
/* field_validation */
int set_field_type(FIELD *field, FIELDTYPE *type, ...);
FIELDTYPE *field_type(const FIELD *field);
void *field_arg(const FIELD *field);
/* field_attributes */
int set_field_fore(FIELD *field, chtype attr);
chtype field_fore(const FIELD *field);
int set_field_back(FIELD *field, chtype attr);
chtype field_back(const FIELD *field);
int set_field_pad(FIELD *field, int pad);
int field_pad(const FIELD *field);
/* field_buffer */
int set_field_buffer(FIELD *field, int buf, const char *value);
char *field_buffer(const FIELD *field, int buffer);
int set_field_status(FIELD *field, bool status);
bool field_status(const FIELD *field);
int set_max_field(FIELD *field, int max);
/* fieldtype */
FIELDTYPE *new_fieldtype( bool (* const field_check)(FIELD *, const void *), bool (* const char_check)(int, const void *));
int free_fieldtype(FIELDTYPE *fieldtype);
int set_fieldtype_arg( FIELDTYPE *fieldtype, void *(* const make_arg)(va_list *), void *(* const copy_arg)(const void *), void (* const free_arg)(void *));
int set_fieldtype_choice( FIELDTYPE *fieldtype, bool (* const next_choice)(FIELD *, const void *), bool (* const prev_choice)(FIELD *, const void *));
FIELDTYPE *link_fieldtype(FIELDTYPE *type1, FIELDTYPE *type2);
/* hook */
int set_field_init(FORM *form, Form_Hook func);
Form_Hook field_init(const FORM *form);
int set_field_term(FORM *form, Form_Hook func);
Form_Hook field_term(const FORM *form);
int set_form_init(FORM *form, Form_Hook func);
Form_Hook form_init(const FORM *form);
int set_form_term(FORM *form, Form_Hook func);
Form_Hook form_term(const FORM *form);
/* win */
int set_form_win(FORM *form, WINDOW *win);
WINDOW *form_win(const FORM *form);
int set_form_sub(FORM *form, WINDOW *sub);
WINDOW *form_sub(const FORM *form);
int scale_form(const FORM *form, int *rows, int *columns);
/* opts */
int set_form_opts(FORM *form, Field_Options opts);
int form_opts_on(FORM *form, Field_Options opts);
int form_opts_off(FORM *form, Field_Options opts);
Field_Options form_opts(const FORM *form);
/* driver */
int form_driver(FORM *form, int c);
/* userptr */
int set_form_userptr(FORM *form, void *userptr);
void* form_userptr(const FORM *form);
/* requestname */
const char *form_request_name(int request);
int form_request_by_name(const char *name);
/* field_just */
int set_field_just(FIELD *field, int justification);
int field_just(const FIELD *field);
/* field_opts */
int set_field_opts(FIELD *field, Field_Options opts);
int field_opts_on(FIELD *field, Field_Options opts);
int field_opts_off(FIELD *field, Field_Options opts);
Field_Options field_opts(const FIELD *field);
/* field */
int set_form_fields(FORM *form, FIELD **fields);
FIELD **form_fields(const FORM *form);
int field_count(const FORM *form);
int move_field(FIELD *field, int frow, int fcol);
/* field_userptr */
int set_field_userptr(FIELD *field, void*userptr);
void *field_userptr(const FIELD *field);
/* new */
FORM *new_form(FIELD **fields);
int free_form(FORM *form);
/* new_page */
int set_new_page(FIELD *field, bool new_page_flag);
bool new_page(const FIELD *field);
/* cursor */
int pos_form_cursor(FORM *form);
/* post */
int post_form(FORM *form);
int unpost_form(FORM *form);
