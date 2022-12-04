/// @description  fs_instance_in_view(inst, view, add)
/// @param inst
/// @param  view
/// @param  add
function fs_instance_in_view(argument0, argument1, argument2) {
	 // Checks if a instance is inside the given view.
	 // "add" can be used to increase the view size check.
 
	    var v_id   = argument0;
	    var v_view = argument1;
	    if(instance_exists(v_id)) && ((v_id.bbox_right > __view_get( e__VW.XView, v_view )-argument2) && (v_id.bbox_left < __view_get( e__VW.XView, v_view ) + __view_get( e__VW.WView, v_view )+argument2) && (v_id.bbox_bottom > __view_get( e__VW.YView, v_view )-argument2) && (v_id.bbox_top < __view_get( e__VW.YView, v_view ) + __view_get( e__VW.HView, v_view )+argument2))
	    {
	       return true;
	    }
	    else return null;



}
