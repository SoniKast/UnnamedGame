/// @description Main Logic.
 
 // Update Input:
    fs_instance_input_receive();

 // Horizontal movement:
    if(is_underwater == false)
	{
       fs_character_movement_horizontal();
	   fs_character_movement_vertical()
	}
	
 // Jumping:
    fs_character_state_jump();