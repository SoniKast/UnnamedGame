/// @description Move the tile and character.
   
 // Only run this if the tile has horizontal or vertical speed.
 // Otherwise this could potentially lead to performance drops. (Tested on a old Laptop with +200 entities and it runs fine so this really shouldn't be much of a issue)
    if(x_speed == 0 && y_speed == 0) exit;
 
 // Horizontal movement:
    x_real   += (x_speed);
    x_handle  = round(x_real);
    x_real   -= x_handle;

    repeat(abs(x_handle))
    {
           // Update X Position.
              x += sign(x_handle);
           
           // In order to properly move entities without having to do another for loop, we simply call code from their end.
              if(instance_exists(par_character))
              {
                 with(par_character)
                 {
                      event_user(2);
                 }    
              }
            /*  if(instance_exists(par_enemy_ground))
              {
                 with(par_enemy_ground)
                 {
                      event_user(0);
                 }    *
              }       */          
    }
    
 // Vertical movement:   
    y_real   += (y_speed);
    y_handle  = round(y_real);
    y_real   -= y_handle;
    
    repeat(abs(y_handle))
    { 
           // In order to properly move entities without having to do another for loop, we simply call code from their end.
              if(instance_exists(par_character))
              {
                 with(par_character)
                 {
                      event_user(3);
                 }    
              }
           /*   if(instance_exists(par_enemy_ground))
              {
                 with(par_enemy_ground)
                 {
                      event_user(1);
                 }    
              } */
             
          // Update Y Position.          
             y += sign(y_handle);                              
    }







