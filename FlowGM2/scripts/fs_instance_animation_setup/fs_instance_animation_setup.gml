/// @description fs_instance_animation_setup(init)
/// @param init
 // Initialize animation variables.
 // init being the initial sprite used when the object is created.

function fs_instance_animation_setup(init_sprite)
{
 
    anim_sprite    = init_sprite; // Sprite to utilize.
    anim_frame     = 0;           // The frame to draw.
    anim_count     = 0;           // How many frames used in the animation.
    anim_speed     = 0;           // How fast the animation plays.
    anim_direction = 1;           // Facing direction of the sprite.
    anim_blend     = c_white;     // The sprites color blend. 
    anim_angle     = 0;           // The sprites angle.
    anim_alpha     = 1;           // The sprites alpha.
    
    // Disable the default frame speed function.
       image_speed = 0;
	   
}