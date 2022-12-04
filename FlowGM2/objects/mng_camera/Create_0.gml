/// @description Camera variables.
    
#region - Camera variables.
 // Set view:
    __view_set( e__VW.Object, 0, id );
    __view_set( e__VW.HBorder, 0, VIEW_W / 2 );
    __view_set( e__VW.VBorder, 0, VIEW_H / 2 );
    view_xhalf      = VIEW_W  * 0.5;
    view_yhalf      = VIEW_H  * 0.5;
    
 // Horizontal Borders:
    border_left  = x-8;
    border_right = x+8;
    
 // Horizontal limits:
    limit_left  = 0;
    limit_right = room_width;
    
 // Vertical Borders:
    border_top    = y-32;
    border_bottom = y+32;
    
 // Vertical limits:
    limit_top    = 0;
    limit_bottom = room_height;
    y_limiter    = noone;
    
 // Camera handle:
    cam_handle = par_character;
    cam_speed  = 6.5;
    
 // Camera position.
    cam_x       = x;
    cam_y       = y;
    cam_x_shift = 0;
    cam_y_shift = 0;
    cam_lag     = 0;

#endregion
 
#region - Culling

	fs_instance_set_culling_mode(culling.ignore, 0);
	
#endregion