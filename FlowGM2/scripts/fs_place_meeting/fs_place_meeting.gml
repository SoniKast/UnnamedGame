/// @description fs_place_meeting(x,y,layer)
/// Extension for the regular place_meeting function, first checks if tiles are colliding,
/// then objects.
/// @param x
/// @param y
/// @param layer
 // Credits to pixelated pope for the tile check method!

function fs_place_meeting(xx, yy, llayer)
{
	
	 // Create variables and the tile checker.
        var _layer   = llayer,
            _tm      = layer_tilemap_get_id(_layer),
		    _checker = mng_tile_checker;
		   
		if(!instance_exists(_checker)) instance_create_depth(0,0,0,_checker); 

     // Create cell variables:
		var _x1 = tilemap_get_cell_x_at_pixel(_tm, bbox_left + (xx - x), y),
			_y1 = tilemap_get_cell_y_at_pixel(_tm, x, bbox_top + (yy - y)),
			_x2 = tilemap_get_cell_x_at_pixel(_tm, bbox_right + (xx - x), y),
			_y2 = tilemap_get_cell_y_at_pixel(_tm, x, bbox_bottom + (yy - y));

     // Check if the cells are colliding with a tile, then adjust the tile checker.
		for(var _x = _x1; _x <= _x2; _x++)
		{
			for(var _y = _y1; _y <= _y2; _y++)
			{
			    _tile = tile_get_index(tilemap_get(_tm, _x, _y));
				if(_tile)
				{
				   _checker.x = _x * tilemap_get_tile_width(_tm);
				   _checker.y = _y * tilemap_get_tile_height(_tm);
				   _checker.image_index = _tile;

				   if(place_meeting(xx, yy, _checker)) 
				   {
					  tile_angle = _checker.tile_angle; 
				      return true;			   
				   }
				}
			}
		}

     // If the above tile method doesn't return anything, check for actual objects.
        if(llayer == LAYER_SOLID)
		{
		   if(place_meeting(xx, yy, par_solid))
		   {
	          return true;
		   }
		 }
		 if(llayer == LAYER_PLATFORM)
		 {
			if(place_meeting(xx, yy, par_platform))
			{
			   return true;
			}
		  }

     // Both tile and object methods had no results, so return false.
		return false;

}


