/// @description fs_character_state_jump()
 // Handle the players jumping state.
 
function fs_character_state_jump()
{

	// Trigger jump:
	   if(ground == true)
	   {
	      if(button_a[input.press] && !place_meeting(x, y-1, par_solid) && state != char_state.jump)
	      {
			 // Jump
				state = char_state.jump;
				
	         // Reset ground flag and set jump variable.
	            ground       = false;
             
	         // Depending on how fast we move, change the jump height accordingly.
	            y_speed = -phy_jump_height+abs(x_speed)/4.7*-1;
	       }
	    }    

	// Stupid
		if(state == char_state.jump)
		{
			if(y_speed < -(phy_jump_height/2))
			{
				if(button_a[input.hold] == false)
				{
					y_speed = -(phy_jump_height/2)	
				}
			}
		}
    
	 // Revert jump state.
	    if(state == char_state.jump && ground)
	    {
	       state = char_state.normal;
	    }
}