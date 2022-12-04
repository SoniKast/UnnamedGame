/// @description Global Setup.
 
 #region - Variables
 // Set a initialized flag to run later events.
    initialized = true;
 
 // Define app data.
    game.app_title   = "FlowFW";
    game.app_version = "1.0";
        
 // Game variables:
    game.debug            = 0;  // Toggles the games debug mode.
    game.frame_enable     = 0;  // Enables the game frame count. Disable if you pause the game or you don't need it.
    game.frame            = 0;  // The games total frame. This can be used to sync animations or events. Resets on room update.
    game.framerate_target = 60; // The games target framerate. You probably want to keep this at 60 for max compatibility with different hardware.
                                // Besides, GameMaker doesn't quite like displays with +60hz refresh rates anyways.
 // Game fonts:
    // game.font_dev = font_add_sprite_ext(fnt_dev, "%()*+,-./0123456789:=ABCDEFGHIJKLMNOPQRSTUVWXYZ", 1, 1);
    game.font_hud = font_add_sprite_ext(fnt_hud, "!#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^-`abcdefghijklmnopqrstuvwxyz", 1, 1);
 
 // Input variables:
    game.input_up     = vk_up;
    game.input_down   = vk_down;
    game.input_left   = vk_left; 
    game.input_right  = vk_right;
    game.input_a      = ord("W");
    game.input_b      = ord("Q");
    game.input_x      = ord("X");
    game.input_y      = ord("S");
    game.input_start  = vk_enter;
    game.input_select = vk_backspace;        
 
 // Sound variables:
    game.sfx_volume   = 1;
    game.bgm_volume   = 1;
 
 // Time variables:
    game.do_time       = false;
    game.game_time     = 0;
    game.object_time   = 0;
    game.player_x      = -1;
    game.player_y      = -1;
    game.temp_player_x = -1;
    game.temp_player_y = -1;
    game.bonus_x       = -1;
    game.bonus_y       = -1;
    game.player_score  = 0;
    game.switch_state  = false;
    game.death_height  = -1;
 
 // Collectibles:
    game.sparkles     = 0;
    
 // Initialize room setup.
    event_user(0);

 // Save / Load data.    
 //   fs_save_load(0);  
    with(mng_display)
    {
         event_user(0);
    }        

#endregion

#region - Culling mode.

    fs_instance_set_culling_mode(culling.ignore, 0);

#endregion