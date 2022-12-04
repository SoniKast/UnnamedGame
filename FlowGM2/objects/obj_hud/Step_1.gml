/// @description Timer
/// Global timers.
    if(game.do_time && game_paused == false)
    {
        game.game_time   += 1000/60;
        game.object_time += 1000/60;
    }
    