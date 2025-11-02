@icon("res://addons/NZ_sprites_extended/Icons/SR_visibility_random.svg")
class_name SR_visibility_random
extends Sprite_resource

@export_range(0,1) var percent : float = 0.5

func _ready(sprite:Node) -> void:
	if randf_range(0.0,1.0) <= percent:
		sprite.visible = !sprite.visible
