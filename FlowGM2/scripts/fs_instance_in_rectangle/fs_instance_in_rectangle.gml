/// @description  fs_instance_in_rectangle(inst, x0, y0, x1, y1)
/// @param inst
/// @param  x0
/// @param  y0
/// @param  x1
/// @param  y1
function fs_instance_in_rectangle(argument0, argument1, argument2, argument3, argument4) {
	 // Checks if a instance is inside a given rectangle.
 
	    var v_id = argument0;
	    var v_x0 = argument1;
	    var v_x1 = argument2;
	    var v_y0 = argument3;
	    var v_y1 = argument4;
    
	    if(instance_exists(v_id)) && (v_id.bbox_right>v_x0 && v_id.bbox_left<v_x1 && v_id.bbox_bottom>v_y0 && v_id.bbox_top<v_y1)
	    {
	       return true;
	    }
	    else return null;




}
