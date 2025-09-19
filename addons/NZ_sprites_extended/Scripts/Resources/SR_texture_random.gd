@icon("res://addons/NZ_sprites_extended/Icons/SR_texture_random.svg")
class_name SR_texture_random
extends Sprite_resource

@export var textures : Array[Texture2D]

func _ready(sprite:Node) -> void:
	if _check_if_this_is_a_sprite(sprite):
		if textures.size() > 0:
			sprite.texture = textures.pick_random()
		else:
			push_error("No textures")
