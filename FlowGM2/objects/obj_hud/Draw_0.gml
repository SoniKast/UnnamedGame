/// @description HUD
/// Fuck    

    // Draw the fonts
    draw_set_halign(fa_left);
    draw_set_color(c_white);
    draw_set_font(game.font_hud);
    
    // Hud elements:
    if(par_character.state != char_state.death)
    {
        draw_sprite(spr_health_hud, par_character.life_points, VIEW_X+13, VIEW_Y+11);
    }
    if(par_character.state == char_state.death)
    {
        draw_sprite(spr_death_hud, 0, VIEW_X+13, VIEW_Y+11);
    }
    draw_sprite(spr_time_hud, 0, VIEW_X+game.display_width/2, VIEW_Y+24);
    draw_sprite(spr_sparks_hud, 0, VIEW_X+game.display_width-68, VIEW_Y+30);
    
    // Timer
    draw_set_halign(fa_left);
    draw_text(VIEW_X+(game.display_width/2)-5, VIEW_Y+32, string(floor(game.game_time/60000))+":"+fs_string_number_format(floor(game.game_time/1000) mod 60, 2, 0));
        
    // Sparkles
    draw_set_halign(fa_right);
    draw_text(VIEW_X+game.display_width-40, VIEW_Y+32, string(game.sparkles));
    draw_set_halign(fa_left);
    
    // Invincibility / Upgrade timer
    /*
	if(instance_exists(par_character))
    {
        // Shift invincibility
        if(par_character.invincibility == 1)
        {
            if(powerup_bar_x[0] < 16)
            {
                powerup_bar_x[0] += floor((16-powerup_bar_x[0]))*.10;
            }
            draw_sprite(spr_timer_bar, 0, VIEW_X+373, VIEW_Y+game.display_height-19);
            draw_set_color(c_blue);
            draw_rectangle(VIEW_X+floor(powerup_bar_x[0]), VIEW_Y+floor(powerup_bar_y[0]), view_xview+floor(powerup_bar_x[0])+(par_character.invincibility_t/900*(80)), view_yview+floor((powerup_bar_y[0])+15), false);   
            draw_set_color(c_white);
        }            
    }
    
    







