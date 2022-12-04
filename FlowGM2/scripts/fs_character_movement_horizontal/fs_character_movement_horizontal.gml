/// @description fs_character_movement_horizontal()
 // Handle the horizontal movement of the character.

function fs_character_movement_horizontal()
{
 
	 // Ground movement:
	    if(ground == true)
	    { 
	       // Set acceleration and running frames.
	          var accel_handle;
       
	          if(button_b[input.hold])
	          {
	             accel_handle = phy_acceleration_run;
	          }
	          else // Regular walk acceleration.
	          {
	             accel_handle = phy_acceleration_walk;
	          }
          
	       // Set the maximum speed the character can horizontally move.
	          fs_character_set_horizontal_limit(true);

	       // Movement to the right.
	          if(dpad_right[input.hold] && not (crouching == true))
	          {
	             if(x_speed < 0) // Decelerate / Skid.
	             {
	                skid_flag = 1;
	                if(x_speed > -phy_speed_turn) { x_speed = 0; }
	                else
	                {
	                   x_speed += phy_deceleration_skid;
	                }
	             }
	             else // Accelerate.
	             {
	                skid_flag = 0;
	                if(x_speed = 0)
	                {
	                   x_speed     = phy_min_walk;
	                   x_speed_max = phy_max_walk;
	                }
	                else
	                {
	                   x_speed = fs_approach(x_speed, x_speed_handle, accel_handle);
	                }                              
	             }
	          }
          
	       // Movement to the left.
	          if(dpad_left[input.hold] && not (crouching == true))
	          {
	             if(x_speed > 0) // Decelerate / Skid.
	             {
	                skid_flag = 1;
	                if(x_speed < phy_speed_turn) { x_speed = 0; }
	                else
	                {
	                   x_speed -= phy_deceleration_skid;
	                }
	             }
	             else // Accelerate.
	             {
	                skid_flag = 0;
	                if(x_speed = 0)
	                {
	                   x_speed = -phy_min_walk;
	                }
	                else
	                {
	                    x_speed = fs_approach(x_speed, -x_speed_handle, accel_handle);
	                }
	             }
	          }       

	      // No input, so decelerate.
	         if(!dpad_left[input.hold] && !dpad_right[input.hold] || crouching == true)
	         {          
	            if(skid_flag == 1)
	            {
	               skid_flag = 0;
	            }
            
	            var decel;
	            decel = phy_deceleration_ground;
            
	            if(x_speed >  decel) { x_speed -= decel; }
	            else
	            if(x_speed < -decel) { x_speed += decel; }
	            else                 { x_speed  = 0; skid_flag = 0; }
	         } 
	    }
		else // In air movement.
		{ 
	         // Set the maximum speed the character can horizontally move.
	            if(abs(x_speed) <> phy_max_walk)
	            {
	               if(!button_b[input.hold])
	               {
	                  x_speed_handle = phy_max_walk;
	               }
	            }
	            if(abs(x_speed) <> phy_max_run && button_b[input.hold])
	            {            
	               x_speed_handle = phy_max_run;
	            }

	         // Movement to the right.
	            if(dpad_right[input.hold])
	            {
	               if(x_speed >= 0) // Accelerate.
	               {
	                  if(x_speed < x_speed_handle)
	                  {
	                     x_speed = fs_approach(x_speed, x_speed_handle, phy_acceleration_air); 
	                  }
	               }
	               else
	               {
	                  if(x_speed < 0) // Decelerate.
	                  {
	                     x_speed = fs_approach(x_speed, x_speed_handle, phy_deceleration_air); 
	                  }                  
	               }
	            }
                
	         // Movement to the left.
	            if(dpad_left[input.hold])
	            {
	               if(x_speed <= 0) // Accelerate.
	               {
	                  if(x_speed > -x_speed_handle)
	                  {
	                     x_speed = fs_approach(x_speed, -x_speed_handle, phy_acceleration_air); 
	                  }                
	               }
	               else
	               {
	                  if(x_speed > 0) // Decelerate.
	                  {
	                     x_speed = fs_approach(x_speed, -x_speed_handle, phy_deceleration_air); 
	                  }
	               }
	            }       
           
		}
		
}