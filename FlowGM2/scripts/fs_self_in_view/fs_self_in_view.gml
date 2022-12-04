/// @description  fs_self_in_view(view, add)
/// @param view
/// @param  add
function fs_self_in_view(argument0, argument1) 
{
	 // Checks if inside the given view.
	 // "add" can be used to increase the view size check.
 
	    var v_view = argument0;
	    if((bbox_right > __view_get( e__VW.XView, v_view )-argument1) && (bbox_left < __view_get( e__VW.XView, v_view ) + __view_get( e__VW.WView, v_view )+argument1) && (bbox_bottom > __view_get( e__VW.YView, v_view )-argument1) && (bbox_top < __view_get( e__VW.YView, v_view ) + __view_get( e__VW.HView, v_view )+argument1))
	    {
	       return true;
	    }
	    else return null;

}
