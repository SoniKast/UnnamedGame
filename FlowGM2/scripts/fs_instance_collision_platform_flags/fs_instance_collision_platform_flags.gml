/// @description fs_instance_collision_platform_flags()
 // Set platform flag to prevent the instance from jumping-through platform slopes.
 
function fs_instance_collision_platform_flags()
{

	    var v_xspeed = x_speed;  
	    if(fs_place_meeting(x, y+1, LAYER_PLATFORM) && !fs_place_meeting(x, y, LAYER_PLATFORM) || fs_place_meeting(x+sign(v_xspeed)+(sign(v_xspeed)*3), y, LAYER_PLATFORM))
	    {
	       platform = 1;
	    }
	    else if(fs_place_meeting(x, y+1, LAYER_SOLID) || !ground)
	    {
	            platform = 0;
	    }

}