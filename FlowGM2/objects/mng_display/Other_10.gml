/// @description Change the display size and/or toggle fullscreen.

 // Toggle fullscreen:
   if(game.display_fullscreen == true)
   {
      game.display_blackout = 5;   
      window_set_fullscreen(true);
      with(mng_master)
      {
           event_user(0);
      } 
   }
   else 
   {             
      // Blackout:
         game.display_blackout = 5;
               
      // Disable fullscreen.
         window_set_fullscreen(false);
         
      // Reset display.
         display_reset(0, game.display_vsync);
    
      // Set up the window.
         window_set_size(game.display_width * game.display_scale, game.display_height * game.display_scale);
    
      // Set up the display.
         display_set_gui_size(game.display_width * game.display_scale, game.display_height * game.display_scale);
    
      // Center the window.
         alarm[0] = 1;
         
      // Update room / fps data.
         with(mng_master)
         {
              event_user(0);
         }               
}




