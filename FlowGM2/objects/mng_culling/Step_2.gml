/// @description  Deactivate instances outside the view.
 // Code inspired by TrianglyRU. Shoutouts to him!

    instance_activate_region(__view_get( e__VW.XView, 0 )-64, __view_get( e__VW.YView, 0 )-64, __view_get( e__VW.WView, 0 )+128, __view_get( e__VW.HView, 0 )+128, true);   
    
 // Deactivate all instances...
    with(all)
    {
         // Check if a culling mode is not already defined.
            if(variable_instance_exists(id, "instance_culling_mode") == false)
            {
               // Define it with the default mode.
                  fs_instance_set_culling_mode(culling.deactivate, 16);
            }
            
         // Deactivate outside the screen.
            if(fs_instance_get_culling_mode() == culling.deactivate)
            {
               //if(!fs_self_in_view(0, instance_culling_size))
			   if(instance_in_camera_view(view_camera, instance_culling_size, instance_culling_size) == false)
               {
                  instance_deactivate_object(id);
               }
            }
            
         // Reset outside the screen.
            if(fs_instance_get_culling_mode() == culling.reset)
            {
               //if(!fs_self_in_view(0, instance_culling_size))
			   if(instance_in_camera_view(view_camera, instance_culling_size, instance_culling_size) == false)
               {
				   if(culling_x+instance_culling_size < VIEW_X
				   or culling_x-instance_culling_size > VIEW_X + VIEW_W)
				   or(culling_y+instance_culling_size < VIEW_Y
				   or culling_y-instance_culling_size > VIEW_Y + VIEW_H)
				   {
		              x = culling_x;
		              y = culling_y;
				   }
               }
            }   
            
         // Reset and deactivate outside the screen.
            if(fs_instance_get_culling_mode() == culling.reset_deactivate)
            {
               //if(!fs_self_in_view(0, instance_culling_size))
			   if(instance_in_camera_view(view_camera, instance_culling_size, instance_culling_size) == false)
               {
				   if(culling_x+instance_culling_size < VIEW_X
				   or culling_x-instance_culling_size > VIEW_X + VIEW_W)
				   or(culling_y+instance_culling_size < VIEW_Y
				   or culling_y-instance_culling_size > VIEW_Y + VIEW_H)
				   {
	                  x = culling_x;
	                  y = culling_y;
	                  instance_deactivate_object(id);
				   }
               }
            }       
                           
         // Destroy outside the screen.
            if(fs_instance_get_culling_mode() == culling.destroy)
            {
               //if(!fs_self_in_view(0, instance_culling_size))
			   if(instance_in_camera_view(view_camera, instance_culling_size, instance_culling_size) == false)
               {
                  instance_destroy();
               }
            }         
    }
    
 // Active M Area.
    instance_activate_region(__view_get( e__VW.XView, 0 )-32, __view_get( e__VW.YView, 0 )-32, __view_get( e__VW.WView, 0 )+64, __view_get( e__VW.HView, 0 )+64, true);     
 

