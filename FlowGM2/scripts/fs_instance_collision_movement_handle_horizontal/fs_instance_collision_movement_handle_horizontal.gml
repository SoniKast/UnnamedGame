/// @description instance_collision_movement_handle_horizontal()
 // Send data to moving tiles. (Horizontal)
 // This will send data to moving tiles you're currently colliding with.
 // Make sure to call the script in a with(other) {} script.
 
function fs_instance_collision_movement_handle_horizontal()
{
	
    inst_id = other.id;
    if(instance_exists(inst_id))          
    {           
       if(inst_id.ground && inst_id.ground_id == id)
       {
          inst_id.x += sign(x_handle);
       }               
                          
       // Push the instance away from this tile to prevent them getting stuck inside the tile.
       // Do this only if the tile is solid.  
          if(tile_is == "par_solid" && inst_id != noone)
          {
             with(inst_id)
             {
                  if(place_meeting(x+x_handle, y, other))
                  { 
                     repeat(abs(x_handle)+1)
                     {
                            if(place_meeting(x+sign(x_handle), y, other))
                            {  
                               // First, check if the tile is moving.
                                 _tileTest = instance_place(x+sign(x_handle), y, other)
                                 if(_tileTest != noone)
                                 {
                                    if(_tileTest.x_handle != 0)
                                    {
                                       if((_tileTest.x_handle < 0 && bbox_left < _tileTest.bbox_right+1) || (_tileTest.x_handle > 0 && bbox_right > _tileTest.bbox_left-1)) // Check if the tile is overlapping with the player.
                                       {
                                          // Update the instances position according to the tiles horizontal speed.                                                  
                                             x += _tileTest.x_handle;    
                                    
                                          // Allow the instance to move away from the tile.
                                             if(sign(x_handle) == -sign(_tileTest.x_handle))
                                             {
                                                x_handle = 0;
                                             }                    
                                       }
                                    }
                                 }
                                 else // The tile isn't moving so simply force the horizontal speed to 0.
                                 {
                                      // Set the horizontal speed to 0.
                                         x_speed = 0;
                                 }       
                             }
                     }
                  }                
             }
          }           
    }
	
}