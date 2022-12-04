/// @description enum_container()
 // List all enums here.
 
function enum_container()
{

	 // Main:
	 // -------------- //
	 
	 // Bounding box sides.
	    enum bbox 
	    {
	         top    = 0,
	         bottom = 1,
	         left   = 2,
	         right  = 3
	    }
    
	 // Instance references.
	    enum instance
	    {
	         character = 0
	    } 
    
	 // Culling modes.
	    enum culling
	    {
	         ignore           = 0,
	         deactivate       = 1,
	         reset            = 2,
	         reset_deactivate = 3,
	         destroy          = 4
	    }
    
	 // Input.
	    enum input
	    {
	         press   = 0,
	         hold    = 1,
	         release = 2
	    }
		
	 // Character:
	 // -------------- //
	
	 // Animations:
		enum char_anim
	    {
	         idle       = spr_char_idle,
	         walk       = spr_char_walk,
			 jog		= spr_char_jog,
			 run		= spr_char_run,
	         jump       = spr_char_jump,
	         fall       = spr_char_fall,
	         skid       = spr_char_skid,
	         wall_slide = spr_char_wall_slide
	    }
    
	 // States:
	    enum char_state
	    {
	         normal     = 0,
	         jump       = 1,
	         wall_slide = 2,
	         death      = 3,
			 hurt		= 4
	    } 
}