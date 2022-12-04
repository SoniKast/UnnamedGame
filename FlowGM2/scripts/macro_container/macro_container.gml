/// @description macro_container()
 // List all macros here.
 
function macro_container()
{

     // Global Game:
	 // -------------- //
	    
		#macro game global
	 //	#macro audio ctr_audio
		#macro null false
		
	// View:
	// --------------- //
		#macro VIEW_X camera_get_view_x(view_camera[0])
		#macro VIEW_Y camera_get_view_y(view_camera[0])
		#macro VIEW_W 480
		#macro VIEW_H 270
		
     // Tile Layers:
	 // -------------- //
	  
	    #macro LAYER_SOLID    "collision_solid"
	    #macro LAYER_PLATFORM "collision_platform"
	
}

