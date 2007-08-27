/* $Id: main.mm,v 1.3 2005/11/25 15:04:35 titer Exp $

   This file is part of the HandBrake source code.
   Homepage: <http://handbrake.m0k.org/>.
   It may be used under the terms of the GNU General Public License. */

#include <Cocoa/Cocoa.h>

void SigHandler( int signal )
{
    [NSApp terminate: NULL];
} 

/****************************************************************************
 * hb_error_handler
 * 
 * Change this to display a dialog box - and maybe move it somewhere else,
 * this is the only place I could find that looked like C :)
****************************************************************************/
extern "C" {
void hb_error_handler( const char *errmsg )
{
    fprintf(stderr, "ERROR: %s\n", errmsg );
}
}

int main( int argc, const char ** argv )
{
    signal( SIGINT, SigHandler );
    return NSApplicationMain( argc, argv );
}
