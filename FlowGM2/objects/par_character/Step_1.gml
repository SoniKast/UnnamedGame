/// @description Collision pre-checks.
 // This sets the ground and ground id flag (id only for object based collision)

 // Set ground flag:
    ground    = fs_instance_collision_ground_check();
    ground_id = fs_instance_collision_side_check(bbox.bottom, par_terrain);
	
 // Get tile angle and set slope flag.
 // NOTE: For tile collisions, please assign angle data in the step event
 // of mng_tile_checker.
    if(ground_id != noone)
    {
       tile_angle = ground_id.tile_angle;
       if(tile_angle <> 0)
       {
          sloped = true;
       }
       else
       {
          sloped               = false;
          tile_slope_direction = 0;
       }
    }
	
 // If we're no longer grounded, disable the slope flag.
    if(ground == false)
    {
       sloped = false;
    }
 
 // Set platform flags:
	fs_instance_collision_platform_flags();

