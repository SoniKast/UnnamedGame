/// @description fs_instance_input_setup()
 // Setup input variables for the current instance. 
 // You probably only need this for character and menus.
 
function fs_instance_input_setup(){

    dpad_up           = 0;
    dpad_down         = 0;
    dpad_left         = 0;
    dpad_right        = 0;
    button_a          = 0;
    button_b          = 0;
    button_x          = 0;
    button_y          = 0;
    button_start      = 0;
    button_select     = 0;
    val_dpad_up       = (game.input_up);
    val_dpad_down     = (game.input_down);
    val_dpad_left     = (game.input_left);
    val_dpad_right    = (game.input_right); 
    val_button_a      = (game.input_a);
    val_button_b      = (game.input_b);
    val_button_x      = (game.input_x);
    val_button_y      = (game.input_y);
    val_button_start  = (game.input_start);
    val_button_select = (game.input_select);
	
}