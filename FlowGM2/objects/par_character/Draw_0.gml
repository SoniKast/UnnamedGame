/// @description Draw and animate character.

 #region - Change animation.
   
 // Standing:
    if(x_speed == 0 && ground == true || wall_hug <> 0 && state != char_state.wall_slide)
    {
      fs_instance_animation_set(char_anim.idle, 15, 1, true, false);
    }
 
 // Walking/Skidding:
    if(x_speed <> 0 && ground == true && wall_hug == 0)
    {
       if(skid_flag == 0)
       {
          if(abs(x_speed) < phy_max_run)
          {
             fs_instance_animation_set(char_anim.walk, 5+(abs(x_speed)*5), 8, true, true);
          }
          else if(abs(x_speed) >= phy_max_run && abs(x_speed) < phy_max_dash)
          {
             fs_instance_animation_set(char_anim.jog, 5+(abs(x_speed)*5), 8, true, true);
          }
          else if(abs(x_speed) >= phy_max_dash)
          { 
             fs_instance_animation_set(char_anim.run, 5+(abs(x_speed)*5), 8, true, true);
          }
       }
       else
       {
          fs_instance_animation_set(char_anim.skid, 5+(abs(x_speed)*4), 9, true, true);       
       }
    }
 
 // Jumping and Falling.    
    if(ground == false && state != char_state.wall_slide)
    {
       if(y_speed < 0)
       {
          fs_instance_animation_set(char_anim.jump, 15, 1, true, false);       
       }
       if(y_speed >= 0)
       {
          fs_instance_animation_set(char_anim.fall, 15, 1, true, false);       
       }       
    }
   /* 
 // Hurt
    if(state == char_state.hurt)
    {
        fs_instance_animation_set(char_anim.hurt, 10, 1, true, false);
    }
    
 // Die
    if(state == char_state.death)
    {
        fs_instance_animation_set(char_anim.death, 10, 1, true, false);
    }*/
    
 // Wall slide.
    if(state == char_state.wall_slide)
    {
       fs_instance_animation_set(char_anim.wall_slide, 10, 4, true, false);      
    }

 #endregion
 
 #region - Change facing direction.
 
    if(ground)
    {
       if(x_speed != 0)
       {
          if(skid_flag == 0)
          {
             anim_direction = sign(x_speed);
          }
          else
          {
             anim_direction = skid_direction;
          }          
       }
    }
    else
    {
       if(state != char_state.wall_slide)
       {
          if(dpad_left[input.hold])  { anim_direction = -1; }
          if(dpad_right[input.hold]) { anim_direction =  1; }       
       }
    }
	
 #endregion
 
 // Animation playback. (To Switch/Update or loop a animation, see event_user 0.
    fs_instance_animation_playback();
    
 // Draw sprite.
    fs_instance_draw();
