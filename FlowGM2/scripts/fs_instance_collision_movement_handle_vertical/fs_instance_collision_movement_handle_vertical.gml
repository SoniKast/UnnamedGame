/// @description fs_instance_collision_movement_handle_vertical()
 // Send data to moving tiles. (Vertical)
 // This will send data to moving tiles you're currently colliding with.
 // Make sure to call the script in a with(other) {} script.
   

function fs_instance_collision_movement_handle_vertical()
{
 
    inst_id = other.id;
    if(instance_exists(inst_id) == true)
    {           
       if(inst_id != noone)
       {                 
          if(inst_id.ground && inst_id.ground_id == id)
          {
             inst_id.y += sign(y_handle);
          }   
          else // Failsafe. Ensure that the instance gets pushed on top of the moving platform in case the system fails and the instances ground flag doesn't get set.
          {
               if(tile_is = "par_platform")
               { 
                  with(inst_id)
                  {
                       if(place_meeting(x, y+1, other) && !place_meeting(x, y, other))
                       {
                          if(y_speed >= 0)
                          {
                             y = other.bbox_top-1;
                          }
                       }
                  }
               }
          }
                 
          // Push out if the tile is moving downwards.
             with(inst_id)
             {
                  _tileTestV = instance_place(x, bbox_bottom-1, other);
                  if(_tileTestV != noone && ground == false)
                  {
                     if(_tileTestV.y_speed > 0 && _tileTestV.tile_is == "par_solid")
                     {
                        if(y_speed < 0)
                        {
                           y_speed = 0.0625;
                        }
                        y = _tileTestV.bbox_bottom+sprite_get_height(mask_index)+2;
                     }
                  }
             }                                  
       }
    }
	
}