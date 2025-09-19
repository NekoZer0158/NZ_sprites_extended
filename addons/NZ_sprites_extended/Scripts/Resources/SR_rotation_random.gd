@icon("res://addons/NZ_sprites_extended/Icons/SR_rotation_random.svg")
@tool
class_name SR_rotation_random
extends Sprite_resource

@export var type : RotationType
@export var allowed_degrees : Array[float] ## works only if type is Array
@export_range(0,360) var min_range : int
@export_range(0,360) var max_range : int
@export var axis : Axis

enum Axis{X,Y,Z}
enum RotationType{RANGE,ARRAY}

func _ready(sprite:Node) -> void:
	if sprite is Sprite2D:
		set_rotation2D(sprite)
	elif sprite is Sprite3D:
		set_rotation3D(sprite)
	else:
		push_error("This is not Sprite2D or Sprite3D")

func set_rotation2D(sprite:Sprite2D) -> void:
	match type:
		RotationType.RANGE:
			sprite.rotation_degrees = randf_range(min_range,max_range)
		RotationType.ARRAY:
			if !allowed_degrees.is_empty():
				sprite.rotation_degrees = allowed_degrees.pick_random()
			else:
				push_error("array allowed_degrees is empty")

func set_rotation3D(sprite:Sprite3D) -> void:
	match type:
		RotationType.RANGE:
			set_rotation_with_axis(sprite,randf_range(min_range,max_range))
		RotationType.ARRAY:
			if !allowed_degrees.is_empty():
				set_rotation_with_axis(sprite,allowed_degrees.pick_random())
			else:
				push_error("array allowed_degrees is empty")

func set_rotation_with_axis(sprite:Sprite3D,value:float) -> void:
	match axis:
		Axis.X:
			sprite.rotation_degrees.x = value
		Axis.Y:
			sprite.rotation_degrees.y = value
		Axis.Z:
			sprite.rotation_degrees.z = value

func _validate_property(property: Dictionary) -> void:
	if (property.name == "min_range" or property.name == "max_range") and type == RotationType.ARRAY:
		property.usage |= PROPERTY_USAGE_READ_ONLY
	else:
		property.usage |= PROPERTY_USAGE_DEFAULT
	if property.name == "allowed_degrees" and type == RotationType.RANGE:
		property.usage |= PROPERTY_USAGE_READ_ONLY
	else:
		property.usage |= PROPERTY_USAGE_DEFAULT
