/// @description Loop/Reset or Switch animation.
 /*
    To loop back to a certain frame, use:
            
    {
       anim_frame = ???;
       break;
    }
            
    To stop a animation, simply break:
            
    {
       break;
    }
            
    To switch a animation, change anim_sprite and break.
            
    {
       anim_sprite = ???;
       break;
    }
            
 */
         
    switch(anim_sprite)
    {
           case char_anim.idle:
		   case char_anim.walk:
		   case char_anim.jog:
		   case char_anim.run:
           case char_anim.jump:  
           case char_anim.fall:
           case char_anim.wall_slide:  
           {
                anim_frame = 0;
                break;
           }
		   case char_anim.skid:      
		   {
				anim_frame = 8;
				break;
		   }
           default:
           {
              break;  
           }                             
    }







