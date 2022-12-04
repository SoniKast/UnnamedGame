/// @description Setup view & fps.
 // If no view data is given in the current room, let this object handle it instead.
    
    if(view_enabled[0] == false)
    {
        view_enabled[0] = true;
        view_visible[0] = true;
        camera_set_view_size(view_camera[0], global.display_width, global.display_height);
        view_wport  [0] = global.display_width;
        view_hport  [0] = global.display_height;
    }
        
 // If the room speed is below the games target framerate, change it.
    if(room_speed != game.framerate_target)
    {
       room_speed  = game.framerate_target;
    }




