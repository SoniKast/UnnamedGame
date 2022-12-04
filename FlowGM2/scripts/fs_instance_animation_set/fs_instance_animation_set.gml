/// @description fs_instance_animation_set(id, speed, count, reset, update)
/// @param id
/// @param speed
/// @param count
/// @param reset
/// @param update
 // Sets a new animation for the current instance.
 /*
    "id"     > being the animation sprite to use.
    "speed"  > being how fast the animation plays back.
    "count"  > how many frames a animation has.
    "reset"  > to reset the animation frame back to 0 once the animaton switches. 
    "update" > to update the animation speed and count every step.
 */
function fs_instance_animation_set(a_id, a_spd, a_cnt, a_rst, a_upd)
{
	
    var v_animation_id           = a_id;
    var v_animation_speed        = a_spd;
    var v_animation_count        = a_cnt;
    var v_animation_frame_reset  = a_rst;
    var v_animation_speed_update = a_upd;
 
    if(anim_sprite != v_animation_id)
    {
       anim_sprite = v_animation_id;
       if(v_animation_frame_reset = true)
       {
          anim_frame = 0;
       }
       anim_speed = v_animation_speed;
       anim_count = v_animation_count;
    }
 
 // Force animation speed/count update.
    if(v_animation_speed_update == true)
    {
       anim_speed = v_animation_speed;
       anim_count = v_animation_count;
    }   
	
}