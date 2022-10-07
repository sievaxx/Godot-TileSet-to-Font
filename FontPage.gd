class_name FontPage
extends Resource

@export var tileset_index:int = 0 # the atlas ID from the tileset this page pulls from
@export var font_size:int = 12 # sets the font size that this page is for
@export var fixed_size:int = 12 # this is the size the font takes up on the source texture
@export var ascent:float = 1.0 # allows you to add more space to the top of the glpyh
@export var descent:float = 11.0 # allows you to add more space to the bottom of the glyph
@export var margin:int = 0 # extra space in front of the glyph, only use if theres space in the texture
@export var height:int = 12 # meant for vertical fonts, just set it to equal fixed_size otherwise
