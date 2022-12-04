/// @description fs_instance_input_receive()
 // Receives input presses. Only use on instances that used fs_instance_input_setup().
 
function fs_instance_input_receive(){

	 // Presses:
	    dpad_up      [input.press] = keyboard_check_pressed(val_dpad_up);         
	    dpad_down    [input.press] = keyboard_check_pressed(val_dpad_down);     
	    dpad_left    [input.press] = keyboard_check_pressed(val_dpad_left);      
	    dpad_right   [input.press] = keyboard_check_pressed(val_dpad_right);    
	    button_a     [input.press] = keyboard_check_pressed(val_button_a);      
	    button_b     [input.press] = keyboard_check_pressed(val_button_b);      
	    button_x     [input.press] = keyboard_check_pressed(val_button_x);      
	    button_y     [input.press] = keyboard_check_pressed(val_button_y);      
	    button_start [input.press] = keyboard_check_pressed(val_button_start);  
	    button_select[input.press] = keyboard_check_pressed(val_button_select); 
 
	 // Holding Down:
	    dpad_up      [input.hold] = keyboard_check(val_dpad_up);        
	    dpad_down    [input.hold] = keyboard_check(val_dpad_down);      
	    dpad_left    [input.hold] = keyboard_check(val_dpad_left);      
	    dpad_right   [input.hold] = keyboard_check(val_dpad_right);     
	    button_a     [input.hold] = keyboard_check(val_button_a);       
	    button_b     [input.hold] = keyboard_check(val_button_b);    
	    button_x     [input.hold] = keyboard_check(val_button_x);      
	    button_y     [input.hold] = keyboard_check(val_button_y);        
	    button_start [input.hold] = keyboard_check(val_button_start);   
	    button_select[input.hold] = keyboard_check(val_button_select);  
    
	 // Release:
	    dpad_up      [input.release] = keyboard_check_released(val_dpad_up);       
	    dpad_down    [input.release] = keyboard_check_released(val_dpad_down);    
	    dpad_left    [input.release] = keyboard_check_released(val_dpad_left);     
	    dpad_right   [input.release] = keyboard_check_released(val_dpad_right);   
	    button_a     [input.release] = keyboard_check_released(val_button_a);      
	    button_b     [input.release] = keyboard_check_released(val_button_b);       
	    button_x     [input.release] = keyboard_check_released(val_button_x);        
	    button_y     [input.release] = keyboard_check_released(val_button_y);     
	    button_start [input.release] = keyboard_check_released(val_button_start);  
	    button_select[input.release] = keyboard_check_released(val_button_select);
    
	 // Canceling:
	    if(dpad_left[input.hold] && dpad_right[input.hold])
	    {
	       dpad_left [input.hold] = 0;
	       dpad_right[input.hold] = 0;       
	    }
}