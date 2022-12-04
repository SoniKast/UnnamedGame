/// @description fs_character_movement_vertical()
 // Handle the characters vertical movement. (Such as gravity)

function fs_character_movement_vertical()
{
	
	 // Gravity:
	    if(ground == false)
	    {
	       if(y_speed < -2 && button_a[input.hold])
	       {
	          y_speed += phy_gravity[0];
	       }
	       else
	       {
	          y_speed += phy_gravity[1];
	       }
	    }
	    else
	    {
	       y_speed = 0;
	    }

	 // Limit how fast we can fall.
	    if(y_speed > phy_fall_max)
	    {
	       y_speed = phy_fall_max;
	    }
 
	 // Stop skidding mid air.
	    if(!ground)
	    {
	       skid_flag = 0;
	    }
		
		
}