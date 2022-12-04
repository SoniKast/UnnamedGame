/// @description  fs_instance_set_culling_mode(mode, size)
/// @param mode
/// @param  size
function fs_instance_set_culling_mode(argument0, argument1) {
	 /* Sets the culling mode. This can be either culling.ignore, culling.deactivate, culling.reset, 
	    culling.reset_deactivate or culling.destroy.
    
	    *Ignore*           > is exactly what it says, the instance will ignore culling.
	    *Deactivate*       > will deactivate the instance out of the view.
	    *Reset*            > will reset the instances position.
	    *Reset Deactivate* > will reset the instances position, then deactivate it.
	    *Destroy*          > will destroy the instance outside the view.
    
	    *size* > Additional size to check before culling.
	    Example: Setting *size* to 32 means that the instance only gets culled if it's boundaries
	             is outside the view + 32 pixels in each axis.
	 */
 
	    var v_mode = argument0;
	    var v_size = argument1;
	    instance_culling_mode = v_mode;
	    instance_culling_size = v_size;
    
	 // Additional variables:
	    if(v_mode == culling.reset || v_mode == culling.reset_deactivate)
	    {
	       culling_x = xstart;
	       culling_y = ystart;
       
	       // Check if there's collision below us, then offset the respawn position.
	       // This prevents the instance from getting stuck inside collision, if it spawns first.
	          if(place_meeting(x, y+1, par_terrain))
	          {
	             culling_y = ystart-4;
	          }
	    }
    



}
