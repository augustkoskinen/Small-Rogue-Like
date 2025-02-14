global.started = false;

randomize()

tilewidth = tilemap_get_width(layer_tilemap_get_id("Blocks"));
tileheight = tilemap_get_height(layer_tilemap_get_id("Blocks"));

var start = generatePath(layer_tilemap_get_id("Blocks"),layer_tilemap_get_id("FloorTiles"),tilewidth,tileheight)
global.startx = start.startx*64
global.starty = start.starty*64

shakex = 0;
shakey = 0;

global.started = true;