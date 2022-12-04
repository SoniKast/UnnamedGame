/// @description fs_character_set_horizontal_limit(is grounded)
/// @param is_grounded
 // Limits the horizontal movement speed and adds or depletes from it
 // depending on if we're walking up or down a slope.
 // (requires slope_behaviour to be set to true in par_character)

function fs_character_set_horizontal_limit(is_grounded)
{
	
	 // Grounded:
	    if(is_grounded == true)
		{
	       // Flat angle behaviour:
	          if(tile_angle == 0)
	          {
	             if(abs(x_speed) <> phy_max_walk)
	             {
	                if(!button_b[input.hold])
	                {
	                   x_speed_handle = phy_max_walk;
	                }
	             }
	             if(abs(x_speed) < phy_max_run && button_b[input.hold])
	             {
	                x_speed_handle = phy_max_run;
	             }
	          }
			  else 
			  {				 
				 // Only run this if we have the slope behaviour variable enabled.
				    if(slope_behaviour == true)
					{
					   // Walking uphill.
					      if(tile_slope_direction == -1)
					      {
							 // 25° & 45° slopes:
							    if(abs(tile_angle) == 25 || abs(tile_angle) == 45)
								{
					               if(abs(x_speed) <> phy_uphill_max_walk)
					               {
					                  if(!button_b[input.hold])
					                  {
					                     x_speed_handle = phy_uphill_max_walk;
					                  }
					               }
					               if(abs(x_speed) <> phy_uphill_max_run && button_b[input.hold])
					               {
					                  x_speed_handle = phy_uphill_max_run;
					               } 
								}	
						  
							 // Steep 75° slopes:
							    if(abs(tile_angle) == 75)
								{
					               if(abs(x_speed) <> phy_uphill_max_walk_75d)
					               {
					                  if(!button_b[input.hold])
					                  {
					                     x_speed_handle = phy_uphill_max_walk_75d;
					                  }
					               }
					               if(abs(x_speed) <> phy_uphill_max_run_75d && button_b[input.hold])
					               {
					                  x_speed_handle = phy_uphill_max_run_75d;
					               } 
								}	
					      }	
					
					   // Walking downhill.
				          if(tile_slope_direction == 1)
				          {
							 // 25°:
				                if(abs(tile_angle) == 25)
				                {
				                   if(abs(x_speed) <> (phy_max_walk+phy_downhill_add_25d))
				                   {
				                      if(!button_b[input.hold])
				                      {
				                         x_speed_handle = (phy_max_walk+phy_downhill_add_25d);
				                      }
				                   }
				                   if(abs(x_speed) < (phy_max_run+phy_downhill_add_25d) && button_b[input.hold])
				                   {
				                       x_speed_handle = (phy_max_run+phy_downhill_add_25d);
				                   }   
				                }						
						
							 // 45°:
				                if(abs(tile_angle) == 45)
				                {
				                   if(abs(x_speed) <> (phy_max_walk+phy_downhill_add_45d))
				                   {
				                      if(!button_b[input.hold])
				                      {
				                         x_speed_handle = (phy_max_walk+phy_downhill_add_45d);
				                      }
				                   }
				                   if(abs(x_speed) < (phy_max_run+phy_downhill_add_45d) && button_b[input.hold])
				                   {
				                       x_speed_handle = (phy_max_run+phy_downhill_add_45d);
				                   }   
				                }
						
							 // 75°:
				                if(abs(tile_angle) == 75)
				                {
				                   if(abs(x_speed) <> (phy_max_walk+phy_downhill_add_75d))
				                   {
				                      if(!button_b[input.hold])
				                      {
				                         x_speed_handle = (phy_max_walk+phy_downhill_add_75d);
				                      }
				                   }
				                   if(abs(x_speed) < (phy_max_run+phy_downhill_add_75d) && button_b[input.hold])
				                   {
				                       x_speed_handle = (phy_max_run+phy_downhill_add_75d);
				                   }   
				                }						  						  
						    }
					}
					else // Same as tile angle 0.
					{
	                        if(abs(x_speed) <> phy_max_walk)
	                        {
	                           if(!button_b[input.hold])
	                           {
	                              x_speed_handle = phy_max_walk;
	                           }
	                        }
	                        if(abs(x_speed) < phy_max_run && button_b[input.hold])
	                        {
	                           x_speed_handle = phy_max_run;
	                        }
					}
			  }
		}
		
}