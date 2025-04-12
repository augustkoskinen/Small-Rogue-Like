event_inherited()

grid = mp_grid_create(0,0,tilemap_get_width(global.map),tilemap_get_height(global.map),64,64)

var _w = tilemap_get_width(global.map);
var _h = tilemap_get_height(global.map);
var _index;
for (var i = 0; i < _w; i++;)
{
for (var j = 0; j < _h; j++;)
    {
    if(tile_get_index(tilemap_get(global.map,i,j))!=0)
		mp_grid_add_cell(grid,i,j)
    }
}

path = path_add()

movespeed = 400;