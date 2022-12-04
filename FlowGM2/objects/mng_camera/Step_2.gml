/// @description Camera movement.

 // Update borders.
    border_left   = (cam_x-8);
    border_right  = (cam_x+8);
    border_top    = (cam_y-32);
    border_bottom = (cam_y+32);
    
 // Set temp view center variables:
    var centerX, centerY;
    centerX = VIEW_W/2;
    centerY = VIEW_H/2;
    
 // Limit Y.
    if (y_limiter != noone)
    {
        limit_bottom = y_limiter.bbox_top;
    }
    else
    {
        limit_bottom = room_height;
    }
    
 // Player camera handling:
    if(cam_handle == par_character)
    {
       // Move camera to the right.
          if(cam_lag == 0)
          {
             if(cam_handle.x > border_right && cam_handle.x <= (limit_right-centerX))
             {
                cam_x += min(abs(cam_handle.x-border_right), 16);
             }
          // Move camera to the left.
             if(cam_handle.x < border_left && cam_handle.x >= (limit_top-centerX))
             { 
                cam_x -= min(abs(cam_handle.x-border_left), 16);
             }       
          }
          
       // Move camera up or down while in the air.
         if(cam_handle.ground == false && cam_handle.state != char_state.death)
         {
            if(cam_handle.y > border_bottom && cam_handle.y < limit_bottom-centerY)
            {
               cam_y += cam_handle.y-border_bottom;
            }
            if(cam_handle.y < border_top && cam_handle.y > limit_top+centerY)
            {
              cam_y -= border_top-cam_handle.y;
            }
         }
          
       // Move camera up or down while grounde.
         if(cam_handle.ground == true && cam_handle.state != char_state.death)
         {
            if(cam_handle.y != cam_y)
            {
               if(abs(cam_handle.y-cam_handle.yprevious) <= 6) 
               {
                  if(cam_handle.y > cam_y && cam_handle.y < limit_bottom-centerY)
                  {
                      cam_y += min(abs(cam_handle.y-cam_y), 6);
                  }    
                  if(cam_handle.y < cam_y && cam_handle.y > limit_top+centerY)
                  {
                     cam_y -= min(abs(cam_y-cam_handle.y), 6);
                  }
               }
               if(abs(cam_handle.y-cam_handle.yprevious) > 6)
               {
                  if(cam_handle.y > cam_y && cam_handle.y < limit_bottom-centerY)
                  {
                     cam_y += min(abs(cam_handle.y-cam_y), 16);
                  }                              
                  if(cam_handle.y < cam_y && cam_handle.y > 0+centerY)
                  {
                     cam_y -= min(abs(cam_y-cam_handle.y), 16);
                  }
               } 
            }
         }                   
    }
    
 // Target camera handling:    
    if(cam_handle != noone && cam_handle != par_character)
    {
       if(cam_handle.x != cam_x)
       {
          if(cam_handle.x > cam_x && cam_x <= limit_right-centerX)
          {
             cam_x += min(abs(cam_handle.x-cam_x), cam_speed);
          }
          if(cam_handle.x < cam_x && cam_x >= limit_left-centerX)
          {
             cam_x -= min(abs(cam_x-cam_handle.x), cam_speed);
          }
       }
       if(cam_handle.y != cam_y)
       {
          if(cam_handle.y > cam_y && cam_y < limit_bottom-centerY)
          {
             cam_y += min(abs(cam_handle.y-cam_y), cam_speed);
          }
          if(cam_handle.y < cam_y && cam_y > limit_top-centerY)
          {
             cam_y -= min(abs(cam_y-cam_handle.y), cam_speed);
          }
       }       
    }
    
 // Update camera near the room borders.
    if(cam_handle == par_character)
    { 
       if(cam_handle.state != char_state.death)
       {
          if(cam_handle.y > limit_bottom-centerY)
          {
             cam_y = fs_approach(cam_y, limit_bottom-centerY, 3);
          }
    
          if(cam_handle.y < limit_top+centerY)
          {
             cam_y = fs_approach(cam_y, limit_top+centerY, 3);
          }
     
          if(cam_handle.x > limit_right-centerX)
          {
             cam_x = fs_approach(cam_x, limit_right-centerX, 3);
          }
       
          if(cam_handle.x < limit_left+centerX)
          {
             cam_x = fs_approach(cam_x, limit_left+centerX, 3);  
          }
       }
    }
    
 // Set position, floor the camera values to prevent jittering.
    x = floor(cam_x + cam_x_shift);
    y = floor(cam_y + cam_y_shift);
