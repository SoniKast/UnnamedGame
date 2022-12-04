/// @description fs_instance_animation_playback()
/// @param id
 // Plays back the instances animations. 

function fs_instance_animation_playback()
{
	
 // Animation payback/loop/switch.
 /* Note:
    Animation speeds are synced to the games framerate, 
    meaning that the choosen speed will always be used no matter the games framerate. 
    So you don't have to worry about any of this when you might want to switch the framerate mid game.
 */
    if(anim_frame + (anim_speed/game.framerate_target) < anim_count)
    {
       anim_frame += (anim_speed/game.framerate_target);
    }
    else // Loop/Switch:
    {
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
         event_user(0);
    }
	
}