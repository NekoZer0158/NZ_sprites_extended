@icon("res://addons/NZ_sprites_extended/Icons/SR_material_random.svg")
class_name SR_material_random
extends Sprite_resource

@export var materials : Array[Material]
@export var clear_materials_after_using : bool = false
@export var change_this_material : MATERIAL_NAMES

enum MATERIAL_NAMES{
	MATERIAL,## Only for Sprite2D
	MATERIAL_OVERRIDE,## Only for Sprite3D
	MATERIAL_OVERLAY## Only for Sprite3D
	}

func _ready(sprite:Node) -> void:
	if _check_if_this_is_a_sprite(sprite):
		if materials.size() > 0:
			if _check_if_materials_are_correct():
				if change_this_material == MATERIAL_NAMES.MATERIAL:
					if sprite is Sprite2D:
						sprite.material = materials.pick_random()
					else:
						push_error("Sprite must be a Sprite2D")
				else:
					if sprite is Sprite3D:
						match change_this_material:
							MATERIAL_NAMES.MATERIAL_OVERRIDE:
								sprite.material_override = materials.pick_random()
							MATERIAL_NAMES.MATERIAL_OVERLAY:
								sprite.material_overlay = materials.pick_random()
					else:
						push_error("Sprite must be a Sprite3D")
				if clear_materials_after_using:
					materials.clear()
		else:
			push_error("There is no materials")

func _check_if_materials_are_correct() -> bool:
	for i in materials:
		match change_this_material:
			MATERIAL_NAMES.MATERIAL:
				if i is not CanvasItemMaterial and i is not ShaderMaterial:
					push_error("Wrong material")
					return false
			MATERIAL_NAMES.MATERIAL_OVERRIDE,MATERIAL_NAMES.MATERIAL_OVERLAY:
				if i is not StandardMaterial3D and i is not ORMMaterial3D and i is not ShaderMaterial:
					push_error("Wrong material")
					return false
	return true
