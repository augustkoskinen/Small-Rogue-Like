event_inherited();

mp_grid_path(grid, path, x, y, oPlayer.x, oPlayer.y, true);
path_start(path, movespeed*delta_time/1000000, path_action_stop, true)