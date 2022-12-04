/// @description Update window & internal resolution.

   if(surface_get_width(application_surface) != game.display_width && surface_get_height(application_surface) != game.display_height)
    {
       surface_resize(application_surface, game.display_width, game.display_height);
       window_set_size(game.display_width*game.display_scale, game.display_height*game.display_scale);
       alarm[0] = 1;   
	   with(mng_master)
	   {
		    event_user(0);
	   }
    }
    if(camera_get_view_width(view_camera[0]) != global.display_width || view_wport[0] != global.display_width)
    {
	   camera_set_view_size(view_camera[0], global.display_width, global.display_height);
       view_wport[0] = global.display_width;
       view_hport[0] = global.display_height;
	   with(mng_master)
	   {
		    event_user(0);
	   }
    }




