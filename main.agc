
// Project: Incoming 
// Created: 2021-01-11

// show all errors
SetErrorMode(2)

// set window properties
SetWindowTitle( "Incoming" )
SetWindowSize( 1024, 768, 0 )
SetWindowAllowResize( 1 ) // allow the user to resize the window

// set display properties
SetVirtualResolution( 1024, 768 ) // doesn't have to match the window
SetOrientationAllowed( 1, 1, 1, 1 ) // allow both portrait and landscape on mobile devices
SetSyncRate( 30, 0 ) // 30fps instead of 60 to save battery
SetScissor( 0,0,0,0 ) // use the maximum available screen space, no black borders
UseNewDefaultFonts( 1 ) // since version 2.0.22 we can use nicer default fonts

#include "gameover.agc"
#include "loader.agc"
#include "mainmenu.agc"
#include "planes.agc"
#include "player.agc"
#include "relativeposition.agc"
#include "secret.agc"
#include "setup.agc"
#include "shell.agc"
#include "strings.agc"
#include "trooper.agc"

gosub loader
gosub setup

//game variables
main = 1
gameover = 0
score = 0
highscore = 0
hits = 0
failreason = 1

// ???
o1 = 0
w = 0
o2 = 0

// player variables
playerangle as float
playerangle = 0.0 // 90 degrees
playerspeed as float
playerspeed = 3

shellspeed as float
shellspeedy = 7
shellspeedx = 5

planespeed = 2.5
p1x as integer
p2x as integer

trooperspeed = 4
currtrooper = 1
t1falling = 0
t2falling = 0

gosub mainmenu_setup


do
    gosub mainmenu
    
    gosub player_move
    gosub player_fire
    
    gosub shell_move
    gosub shell_hit
    
    gosub plane_move
    gosub plane_drop
    
    gosub trooper_move
    gosub trooper_hit
    gosub trooper_idle
    
    if hits >= 5
		gameover = 1
		gosub gameover
	endif

    Print("Score: " + str(score))
    
    Sync()
loop
