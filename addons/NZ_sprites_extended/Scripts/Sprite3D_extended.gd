class_name Sprite3D_extended
extends Sprite3D

@export var sprite_resources : Array[Sprite_resource]

func _ready() -> void:
	for i in sprite_resources:
		if i != null:
			i._ready(self)
