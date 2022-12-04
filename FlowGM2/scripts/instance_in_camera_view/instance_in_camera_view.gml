/// @function instance_in_camera_view(camera, addSizeH, addSizeW)
/// @description Returns whether the given instance id exists inside the camera view.
/// @param {real} camera   - The camera id.
/// @param {real} addSizeH - Optional parameter to increase/decrease the view size to check. (Horizontal axis)
/// @param {real} addSizeV - ^^. (Vertical axis)

function instance_in_camera_view(_camera=0, _addSizeH=0, _addSizeV=0)
{
	 // Get camera view and size:
        var _x1 =       camera_get_view_x      (_camera);
	    var _y1 =       camera_get_view_y      (_camera);
	    var _x2 = _x1 + camera_get_view_width  (_camera);
	    var _y2 = _y1 + camera_get_view_height (_camera);
	
	 // Return the results.
	    return point_in_rectangle(x, y, _x1-_addSizeH, _y1-_addSizeV, _x2+_addSizeH, _y2+_addSizeV);        
}