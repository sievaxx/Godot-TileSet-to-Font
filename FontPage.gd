class_name FontPage
extends Resource

@export var tileset_index:int = 0 # the atlas ID from the tileset this page pulls from
@export var font_size:int = 8 # sets the font size that this page is for
@export var fixed_size:int = 8 # this is the size the font takes up on the source texture
@export var ascent:float = 4.0 # refer to github doc (https://github.com/Sievaxx/Godot-TileSet-to-Font)
@export var descent:float = 4.0 # refer to github doc (https://github.com/Sievaxx/Godot-TileSet-to-Font)
@export var margin:int = 0 # extra space in front of the glyph, only use if theres space in the texture
@export var height:int = 8 # meant for vertical fonts, just set it to equal fixed_size otherwise
