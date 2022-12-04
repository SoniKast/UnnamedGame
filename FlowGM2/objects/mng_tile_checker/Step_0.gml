/// @description Set tile angle.
 // Set the tile angle depending on the image index.
 
    switch(image_index)
	{
		   // Steep:
		      case  3:
		      case 11:
		      {
			       tile_angle = 75;
				   break;
		      }
			  case  4:
			  case 12:
			  {
				   tile_angle = -75;
				   break;
			  }
			  
		   // 45°:
		      case 18:
		      {
			       tile_angle = 45;
				   break;
		      }
			  case 21:
			  {
				   tile_angle = -45;
				   break;
			  }
			  
		   // 25°:
		      case 24:
		      case 25:
		      {
			       tile_angle = 25;
				   break;
		      }
			  case 30:
			  case 31:
			  {
				   tile_angle = -25;
				   break;
			  }
			  
		   // Null:
		      default:
		      {
			      tile_angle = 0;
			      break;
		      }
	}
