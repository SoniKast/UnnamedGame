/// @description Character setup.

 #region - Variable setup.
 
 // Horizontal speed:
    x_speed        = 0;	// Get/Set the horizontal speed.
    x_handle	   = 0; // Used to store the x_speed.
    x_real         = 0;	// Real horizontal speed, used for sub pixel movement.
    x_speed_handle = 0; // The max. speed we can move at.
    x_current      = x; // Current x position.
	x_previous     = x; // Alt. x previous variable.
	
 // Vertical speed:
    y_speed    = 0; // Get/Set the vertical speed.
    y_handle   = 0; // Used to store the y_speed.    
    y_real     = 0; // Real vertical speed, used for sub pixel movement.
    y_current  = y; // Current y position.
	y_previous = y; // Alt. y previous variable.
	
 // States & Flags:
    state            = char_state.normal; // Get/Set the characters state.
    ground           = false;             // Get/Set the characters ground state.
    ground_id        = noone;             // Get/Set the id of the object tile we're grounded on.
	platform         = false;             // Platform flag to prevent jumping through platform slopes.
    sloped           = false;             // Is the character on a slope?
    slope_behaviour  = true;              // Enable whether the characters behaviour (for ex: jumping and movement speed) changes on slopes.
    crouching        = false;             // Is the character crouching?
	wall_hug         = false;             // Is the character hugging a wall? You can use this to check if the character is or has collided with a wall.
    wallslide_ignore = 10;                // A variable to ignore wallslide tiles for 10 frames. Prevents attaching too fast when leaving ground.
    
 // Skidding variables:
    skid_flag      = 0;    // Set or check if we're skidding.
    skid_direction = 1;    // The facing direction while we're skidding.
    skid_threshold = 1.15; // How fast the character needs to move to trigger skidding.
    
 // Tile variables:
    tile_angle           = 0;  // Angle of the current tile you're colliding with.
    tile_slope_direction = -1; // Returns whether we go up or down. (-1 = Up, 1 = Down)
	
 // Underwater.
    is_underwater = false; // Gets/Sets the characters underwater state.
	
 // Life points.
	life_points	= 4;	// Set up life points.

 #endregion

 #region - Input setup.

    fs_instance_input_setup();
	
 #endregion
 
 #region - Physic setups.

 // Walk / Run speeds:
    phy_max_horizontal = 1.5625;     // Keeps track of the current max. horizontal speed.
    phy_max_walk       = 1.5625;     // The max. horizontal walking speed.
    phy_max_run        = 3;			 // The max. horizontal running speed.
    phy_max_dash       = 4.75;		 // The max. horizontal full-run speed.
    phy_min_walk       = 0.07421875; // The min. horizontal walking speed.
    phy_speed_turn     = 0.5625;     // The speed at which we turn.
    
 // Acceleration / Deceleration:
    phy_acceleration_walk   = 0.037109375;  // Acceleration while walking.
    phy_acceleration_run    = 0.0556640625; // Acceleration while running.
    phy_deceleration_ground = 0.05078125;   // Deceleration on ground.
    phy_deceleration_skid   = 0.1015625;    // Skid deceleration on ground.
    phy_acceleration_air    = 0.0546875;    // Acceleration while in the air. 
    phy_deceleration_air    = 0.125;        // Deceleration while in the air.
    
 // Slope physics:
    phy_uphill_max_walk     = 0.8125; // The max. horizontal walking speed while going uphill.
    phy_uphill_max_run      = 1.375;  // The max. horizontal running speed while going uphill.  
	phy_uphill_max_dash     = 1.875;  // The max. horizontal running speed while going uphill.  
	phy_uphill_max_walk_75d = 0.4612; // The max. horizontal walking speed while going up steel hills.
	phy_uphill_max_run_75d  = 0.9612; // The max. horizontal running speed while going up steel hills.	
    phy_uphill_max_dash_75d = 1.4612; // The max. horizontal running speed while going up steel hills.	
    phy_downhill_add_25d    = 0.125;  // Speed added while walking down 25° tiles.
    phy_downhill_add_45d    = 0.1875; // Speed added while walking down 45° tiles.
    phy_downhill_add_75d    = 0.7875; // Speed added while walking down 75° tiles.
	
 // Jump heights:
    phy_jump_height = [-5.1135, -5.1435, -5.1835]; // The jump height. 
   
 // Rebound heights:
    phy_jump_rebound = -4.4535 // Enemy rebound height.
    
 // Gravity:
    phy_gravity[0] = 0.0625; // Gravity that applies if vertical speed is less than -2 and we're holding jump.
    phy_gravity[1] = 0.3125; // Gravity that applies when the player lets go of the jump button or his vertical speed is more than 0.
    phy_fall_max   = 6.3125; // How fast the player is allowed to fall.
	
 #endregion 
 
 #region - Sprite & Animation setup.

    fs_instance_animation_setup(-1);

 #endregion

    fs_instance_set_culling_mode(culling.ignore, 0);