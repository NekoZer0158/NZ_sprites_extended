@abstract
@icon("res://addons/NZ_sprites_extended/Icons/Sprite_resource.svg")
class_name Sprite_resource
extends Resource

func _ready(_sprite:Node) -> void:
	pass

## Use whenever you need to check if a node is Sprite2D or Sprite3D
func _check_if_this_is_a_sprite(supposed_sprite:Node) -> bool:
	if supposed_sprite is Sprite2D or supposed_sprite is Sprite3D:
		return true
	push_error("This is not Sprite2D or Sprite3D")
	return false
