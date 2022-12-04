/// Game initialization:

 // Create persistent controllers.
 // Do not change the order of the instance creation, otherwise you will run into errors.
    instance_create_depth(0, 0, 0, mng_display); 
    instance_create_depth(0, 0, 0, mng_master);

 // If the game is running from Game Makers IDE, automatically toggle on debug mode. 
 // Otherwise toggle release mode on. This can further improve the games performance.
    if(parameter_count() == 3) && (string_count("_VM", parameter_string(2)))
    {
       game.debug = 1;   
	   show_debug_message("Initialized Game - Running in Debug Mode!")
    }
    else
    {
       gml_release_mode(true);
    }
    
 // Finally, go to the next room.
    room_goto_next()