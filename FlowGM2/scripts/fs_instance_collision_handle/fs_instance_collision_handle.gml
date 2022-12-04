///@description fs_instance_collision_handle()
 // Handle the instance collision system. 
 // Only use this on instances setup with fs_instance_common_initialization()
 
 // NOTE: Due to all the calculations that have to be done, i don't recommend using this collision
 // method on every single instance. The current template runs fine on older hardware with 25 clones
 // of the character object but add more and the fps start to tank.
 
 // For enemies, use the lighter versions of these functions, such as fs_instance_collision_handle_light()
 // or your own movement and collision code.
 
 function fs_instance_collision_handle()
 {
	 
	 // Set a handle variable so we can move / collide using sub pixels. 
	    x_real   += (x_speed);
	    x_handle  = round(x_real);
	    x_real   -= x_handle;

	    repeat(abs(x_handle))
	    {
			// Previous position:
			   x_previous = x;

	        // Moving up slope:
	           if(fs_place_meeting(x+sign(x_handle), y, LAYER_SOLID) && !fs_place_meeting(x+sign(x_handle), y-1, LAYER_SOLID))
	           {
	              --y;
				  tile_slope_direction = -1;
	           }
	        // Steep slope (2 pixels high)
	           if(fs_place_meeting(x+sign(x_handle), y, LAYER_SOLID) && !fs_place_meeting(x+sign(x_handle), y-2, LAYER_SOLID))
	           {
	              y-=2;
				  tile_slope_direction = -1;
	           }                      
           
	        // Additional section for platforms:
	           if((ground == true || platform == 1) && (fs_place_meeting(x+sign(x_handle), y, LAYER_PLATFORM) && !fs_place_meeting(x+sign(x_handle), y-1, LAYER_PLATFORM)))
	           {
	              --y;
				  tile_slope_direction = -1;
	           }     
	           if((ground == true || platform == 1) && (fs_place_meeting(x+sign(x_handle), y, LAYER_PLATFORM) && !fs_place_meeting(x+sign(x_handle), y-2, LAYER_PLATFORM)))
	           {
	              y-=2;
				  tile_slope_direction = -1;
	           }
                         
	        // Moving down slope:
	           if(!fs_place_meeting(x+sign(x_handle), y, LAYER_SOLID) && !fs_place_meeting(x+sign(x_handle), y + 1, LAYER_SOLID) && fs_place_meeting(x+sign(x_handle), y + 2, LAYER_SOLID))
	           {
	              ++y;
				  tile_slope_direction = 1;
	           }              
	        // Steep slope (2 pixels high)
	           if(!fs_place_meeting(x+sign(x_handle), y, LAYER_SOLID) && !fs_place_meeting(x+sign(x_handle), y + 1, LAYER_SOLID) && !fs_place_meeting(x+sign(x_handle), y + 2, LAYER_SOLID) && fs_place_meeting(x+sign(x_handle), y + 3, LAYER_SOLID))
	           {
	              y+=2;
				  tile_slope_direction = 1;
	           }             
                    
	        // Additional section for platforms:     
	           if((ground == true || platform == 1) && (!fs_place_meeting(x+sign(x_handle), y, LAYER_PLATFORM) && !fs_place_meeting(x+sign(x_handle), y + 1, LAYER_PLATFORM) && fs_place_meeting(x+sign(x_handle), y + 2, LAYER_PLATFORM)))
	           {
	              ++y;
				  tile_slope_direction = 1;
	           }              
	           if((ground == true || platform == 1) && (!fs_place_meeting(x+sign(x_handle), y, LAYER_PLATFORM) && !fs_place_meeting(x+sign(x_handle), y + 1, LAYER_PLATFORM) && !fs_place_meeting(x+sign(x_handle), y + 2, LAYER_PLATFORM) && fs_place_meeting(x+sign(x_handle), y + 3, LAYER_PLATFORM)))
	           {
	              y+=2;
				  tile_slope_direction = 1;
	           }      
                             
	        // Flat:
	           if(!fs_place_meeting(x+sign(x_handle), y, LAYER_SOLID))
	           {
	              x += sign(x_handle);
              
	              // We're no longer hugging a wall.
	                 if(wall_hug != 0)
	                 {
	                    wall_hug = 0;
	                 }
	           }
	           else
	           {
	              // We're most likely hugging a wall at this frame, so set the variable.
	                 wall_hug = sign(x_speed);           
              
	              // Call user event 1 to decide what should happen after hitting a wall.
	                 event_user(1);
	           }
			   
			// Set current x position.
			   x_current = x;
	    }

	 // Vertical movement & collision handling:
 
	 // Set a handle variable so we can move / collide using sub pixels.
	    y_real   += (y_speed);
	    y_handle  = round(y_real);
	    y_real   -= y_handle; 
    
	    repeat(abs(y_handle))
	    {
			// Previous position:
			   y_previous = y;
			   
	           if(y_speed <= 0)
	           {
	              // When we hit a ceiling, set the vertical speed to 0...
	                 if(fs_place_meeting(x, y+sign(y_handle), LAYER_SOLID)) 
	                 {
	                    y_speed = 0;
	                    break;
	                 }
	                 else
	                 {
	                    y += sign(y_handle);
	                 }
	           }
	           else if(fs_instance_collision_ground_check()) // If we hit the ground, set the vertical speed to 0...
	           {                  
	                   y_speed = 0;
	                   break;
	           }
	           else // ... else keep moving vertically.
	           {
	              y += sign(y_handle);
	           }
			   
			// Set current y position.
			   y_current = y;
	    }
	
 }