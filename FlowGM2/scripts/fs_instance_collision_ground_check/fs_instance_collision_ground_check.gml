/// @description fs_instance_collision_ground_check()
 // Receive the ground flags, such as the id, type and angle of the collision we're grounded on.
 
function fs_instance_collision_ground_check()
{

	 // Checks if we're colliding with the ground.
	    var v_yspeed = y_speed;
    
	    return fs_place_meeting(x, y+1, LAYER_SOLID)
	    ||     (v_yspeed >= 0 && (fs_place_meeting(x, y+1, LAYER_PLATFORM) && !fs_place_meeting(x, y, LAYER_PLATFORM)));

}