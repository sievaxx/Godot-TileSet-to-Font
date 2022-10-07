@tool
extends Node

@export var tiles:TileSet # make your font "tiles" in here
@export var font_pages:Array[FontPage]

@export_file("*.tres", "*.res") var path: String
var font:FontFile


func add_font_size(page:FontPage):
	var source:TileSetAtlasSource = tiles.get_source(page.tileset_index)
	var tex = source.texture.get_image()
	
	# required to be set but in our case we don't need them
	font.hinting = 0
	font.oversampling = 0
	font.antialiasing = 0
	font.subpixel_positioning = 0
	
	font.set_texture_image(0, Vector2(page.font_size, 0), 0, tex)
	
	font.set_cache_ascent(0, page.font_size, 1.0)
	font.set_cache_descent(0, page.font_size, 11.0)
	
	var char_count = source.get_tiles_count()
	print(char_count)
	
	for i in char_count:
		var tid:Vector2i = source.get_tile_id(i)
		var glyph:TileData = source.get_tile_data(tid, 0)
		var col:PackedVector2Array = glyph.get_collision_polygon_points(0, 0)
		if col.size() <= 0: col = [Vector2(0, 0), Vector2(page.fixed_size/2, 0)]
		var character = glyph.get_custom_data("character")
		var idx:int = character.unicode_at(0) 
		
		# copied the way its done in godot source code
		
		var advance:Vector2i # distance to place the *next* character from this one
		var offset:Vector2i # offset of where to draw glyph related to where its origin is
		var uv_rect:Rect2 # glyph uvs on the font image in pixels
		var gl_size:Vector2i # just uses uv rect size for bitmap fonts
		
		# uv rect is glyph uvs on the font image in pixels
		uv_rect.position = page.fixed_size * Vector2(tid) # fixed size * tile atlas coordinate
		uv_rect.size.x = page.fixed_size/2 + (col[1].x) + page.margin # UV rect size is based on center point, half-width offset
		uv_rect.size.y = page.height # only really matters to vertical fonts, just use fixed size
		gl_size = uv_rect.size
		offset = Vector2(0, 0)
		advance.x = page.fixed_size/2 + col[1].x + page.margin # half-width offset as polygon points are also relative to centre
		
		#set glyph properties now
		font.set_glyph_advance(0, page.font_size, idx, advance)
		font.set_glyph_offset(0, Vector2i(page.font_size, 0), idx, offset)
		font.set_glyph_size(0, Vector2i(page.font_size, 0), idx, gl_size)
		font.set_glyph_uv_rect(0, Vector2i(page.font_size, 0), idx, uv_rect)
		font.set_glyph_texture_idx(0, Vector2i(page.font_size, 0), idx, 0)
	
	# empty element in the font page, required by godot for an unknown reason
	font.set_glyph_advance(0, page.font_size, 0, Vector2(0, 0))
	font.set_glyph_offset(0, Vector2i(page.font_size, 0), 0, Vector2(0, 0))
	font.set_glyph_size(0, Vector2i(page.font_size, 0), 0, Vector2(0, 0))
	font.set_glyph_uv_rect(0, Vector2i(page.font_size, 0), 0, Rect2(0, 0, 0, 0))
	font.set_glyph_texture_idx(0, Vector2i(page.font_size, 0), 0, -1)
	pass

func _ready():
	
	print("font creator loaded")
	font = FontFile.new()
	font.clear_size_cache(0)
	font.clear_cache()
	
	for i in font_pages:
		add_font_size(i)
		pass
	
	font.set_fixed_size(-1) # if only using one font size, change this to match that
	
	ResourceSaver.save(font, path)
	pass

