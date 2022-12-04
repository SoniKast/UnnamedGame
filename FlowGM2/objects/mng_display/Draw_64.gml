/// @description Draw application.

 // Draw display filter.
    if(game.display_filter != noone && game.shader_enable == true)
    {
       shader_set(game.display_filter);
    }
 
 // Disable alpha blending.
    gpu_set_blendenable(0);
    
 // Draw the application surface.
    draw_surface_stretched(application_surface, 0, 0, game.display_width, game.display_height);
    
 // Enable alpha blending.
    gpu_set_blendenable(1);

 // Reset display filter.
    if(game.display_filter != noone)
    {
       shader_reset();
    }
 
 // Set the GUI scale.
    display_set_gui_maximise(game.display_scale, game.display_scale);
    display_set_gui_size(game.display_width, game.display_height);  

 // Blackout.
    if(game.display_blackout > 0)
    {
       game.display_blackout--;
       draw_set_color(c_black)
       draw_rectangle(0, 0, game.display_width, game.display_height, false);
       draw_set_color(c_white);
    }
    
 // Set the title
    window_set_caption(game.app_title + game.app_version);
    
 // Debug text.
 /*   if(game.debug == 1)
    { 
       draw_set_font(game.font_dev);
       draw_text(2, 2, "-IDE/DEBUG MODE-");
       draw_text(2, 2+9*2, "FPS: "+string(fps));
       draw_text(2, 2+9*3, "REAL FPS: "+string(fps_real))
       draw_text(2, 2+9*4, "INSTANCE COUNT: "+string(instance_count))       
    }

*/