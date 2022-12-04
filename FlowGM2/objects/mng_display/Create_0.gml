/// @description Display variables.

#region - Main:

    game.display_width      = 480; // The width of the game display.
    game.display_height     = 270; // The height of the game display.
    game.display_scale      = 3;   // The current scale of the display.
    game.display_fullscreen = 0;   // The current fullscreen state.
    game.display_vsync      = 1;   // Whether the game uses vertical sync.
 
 // Visual effects:
    game.display_filter   = shd_grayscale; // Current display filter. (Example: Sepia)
    game.display_blackout = 0;     // Fully darkens the display for the given amount of frames. Do this when switching between
                                   // different screen sizes to prevent the player from seeing the switch happen.

 
 // Shader compile.
 // If one or more shaders fail to compile, disable shaders
    shader_array[0] = shd_grayscale;
   
    for(var i=0; i<array_length(shader_array); i++)
    {
        if(shader_is_compiled(shader_array[i]) == false)
        {
           game.shader_enable = false;
           break;
        }
        else
        {
           game.shader_enable = true;
        }
    } 
      
 // Disable the automatic drawing of the display.     
    application_surface_draw_enable(0);

 // Remove the sprite so it won't show up in the surface.
    sprite_index = -1;
   
 // Reset data when (re)starting the game. 
    display_set_gui_maximise(-1, -1); 
    display_set_gui_size(-1, -1);    
    event_user(0);

#endregion

#region - Culling mode.
    
	fs_instance_set_culling_mode(culling.ignore, 0);

#endregion