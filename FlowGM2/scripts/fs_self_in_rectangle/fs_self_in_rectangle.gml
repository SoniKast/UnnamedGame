/// @description  fs_self_in_rectangle(x0, y0, x1, y1)
/// @param x0
/// @param  y0
/// @param  x1
/// @param  y1
function fs_self_in_rectangle(argument0, argument1, argument2, argument3) {
	 // Checks if inside a given rectangle.
 
	    var v_x0 = argument0;
	    var v_x1 = argument1;
	    var v_y0 = argument2;
	    var v_y1 = argument3;
    
	    if(bbox_right>v_x0 && bbox_left<v_x1 && bbox_bottom>v_y0 && bbox_top<v_y1)
	    {
	       return true;
	    }
	    else return null;



}
