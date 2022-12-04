/// @description Setup variables
/// Culling mode.
    fs_instance_set_culling_mode(culling.ignore, 0);
	
 // Set global variables that need to be set for levels.
    game.do_time     = false;     
    
 // Paused:
 
    game_background    = noone;
    game_paused        = false;
    game_pbg           = noone;
	
	
	depth = -999;