/// @description fs_character_state_jump()
 // Handle the players jumping state.
 
function fs_character_state_jump()
{

	// Trigger jump:
	   if(ground == true)
	   {
	      if(button_a[input.press] && !place_meeting(x, y-1, par_solid))
	      {
	         // Reset ground flag and set jump variable.
	            ground       = false;
             
	         // Depending on how fast we move, change the jump height accordingly.
	            if(abs(x_speed) < 1)
	            {
	               y_speed = phy_jump_height[0];
	            }
	            if(abs(x_speed) >= 1 && abs(x_speed) < 2)
	            {
	               y_speed = phy_jump_height[1];
	            }
	            if(abs(x_speed) >= 2)
	            {
	               y_speed = phy_jump_height[2];
	            }
	       }
	    }    
		
}