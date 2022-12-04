/// @description fs_instance_draw
 // Draws a instance with the proper values. Only use this if you're using the custom animation system.
 
function fs_instance_draw()
{
    draw_sprite_ext(anim_sprite, floor(anim_frame), floor(x), floor(y), anim_direction*image_xscale, image_yscale, anim_angle, anim_blend, anim_alpha);
}