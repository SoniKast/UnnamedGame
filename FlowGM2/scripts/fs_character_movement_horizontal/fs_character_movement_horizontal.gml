/// @description fs_character_movement_horizontal()
 // Handle the horizontal movement of the character.
 
function fs_character_movement_horizontal()
{

 // Update the max. movement speed.
 // We change this depending on the the run button input.
    if(ground == true)
    {
       // Set the speed to running:
       if(button_b[input.hold] == true)
       {
          if(phy_max_horizontal < phy_max_dash)
          {
              phy_max_horizontal = phy_max_run;     
          }
          if(alarm[0] == -1)
          {
              alarm[0] = 80;
          }      
       }
       else
       {
            phy_max_horizontal = phy_max_walk;
       }
    }
    
 // Movement to the right.
    if(dpad_right[input.hold] && !dpad_left[input.hold])
    {
       // Accelerate, if the horizontal speed is equal or larger than 0.
          if(x_speed >= 0)
          {
             // Disable the skidding flag, if it's turned on. 
                if(skid_flag == 1)
                {
                   skid_flag = 0;
                }
                
             // Add to the horizontal speed.
				if(x_speed != phy_max_horizontal)
				{
				  x_speed += phy_horizontal_acc;
				}
                
             // Limit the max. speed.
                if(x_speed > phy_max_horizontal)
                {
                   x_speed = phy_max_horizontal;
                }
          }
          else // Change direction and/or skid.
          {   
                  if(ground == true)
                  {
                     if(x_speed <= -skid_threshold)
                     {
                        // Enable skidding.
                           skid_flag      = 1;
                           skid_direction = sign(x_speed);
                     }
                     else
                     {
                        // Change the direction of the character.
                           x_speed *= -0.1;
                     }
                     
                     // Skid accelerate:
					x_speed += phy_horizontal_acc_skid/1.45;

					// Smoke effect:
					if(instance_number(obj_char_smoke) < 6)
					{
						if(--skid_smoke_delay <= 0)
						{
							skid_smoke_delay = 6;
							instance_create_depth(x, y, -5, obj_char_smoke);
						}
					}
					// sfx_play(snd_char_skid, game.sfx_volume, 1, 1);  
                  }
                  else // In the air, always decelerate using the skid values.
                  {
                          x_speed += phy_horizontal_acc_skid;
                  }
          }
    }
    
    
 // Movement to the left.
    if(!dpad_right[input.hold] && dpad_left[input.hold])
    {
       // Accelerate, if the horizontal speed is equal or less than 0.
          if(x_speed <= 0)
          {
             // Disable the skidding flag, if it's turned on. 
                if(skid_flag == 1)
                {
                   skid_flag = 0;
                }
                
             // Add to the horizontal speed.
				if(x_speed != -phy_max_horizontal)
				{
				  x_speed -= phy_horizontal_acc;
				}
                
             // Limit the max. speed.
                if(x_speed < -phy_max_horizontal)
                {
                   x_speed = -phy_max_horizontal;
                }
          }
          else // Change direction and/or skid.
          {   
                  if(ground == true)
                  {
                     if(x_speed >= skid_threshold)
                     {
                        // Enable skidding.
                           skid_flag      = 1;
                           skid_direction = sign(x_speed);
                     }
                     else
                     {
                        // Change the direction of the character.
                           x_speed *= -0.1;
                     }
                     
                     // Skid accelerate:
					x_speed -= phy_horizontal_acc_skid/1.45;

					// Smoke effect:
					if(instance_number(obj_char_smoke) < 6)
					{
						if(--skid_smoke_delay <= 0)
						{
							skid_smoke_delay = 6;
							instance_create_depth(x, y, -5, obj_char_smoke);
						}
					}
					// sfx_play(snd_char_skid, game.sfx_volume, 1, 1);  
                  }
                  else // In the air, always decelerate using the skid values.
                  {
                          x_speed -= phy_horizontal_acc_skid;
                  }
          }
    }
    
 // Decelerate if no input is given.
    if(!dpad_right[input.hold] && !dpad_left[input.hold]) 
    {
       if(ground == true)
       {
          // Decelerate until we stop.
             if(skid_flag == 0)
             {
				x_speed = max(0, abs(x_speed)-phy_deceleration_ground)*sign(x_speed);
             }
             else
             {
				x_speed = max(0, abs(x_speed)-phy_deceleration_ground*2)*sign(x_speed);         
             }
             
          // Clamp horizontal speed to 0.
             if((x_speed < phy_deceleration_ground) && (x_speed > -phy_deceleration_ground))
             {
                if(skid_flag == 1)
                {
                   skid_flag = 0;
                }
                x_speed = 0;
             }                          
       }
       else // Slowly come to a stop mid air.
       {
            // Decelerate until we stop:             
               x_speed = max(0, abs(x_speed)-phy_deceleration_ground/2)*sign(x_speed);    
                     
            // Clamp horizontal speed to 0.
               if((x_speed < phy_deceleration_ground) && (x_speed > -phy_deceleration_ground))
               {
                  x_speed = 0;
               }   
       }
    }
            
 // Revert skid flag if not grounded.
    if(!ground)
    {
       skid_flag = 0;
    }
		
}
    