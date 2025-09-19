class_name Sprite2D_extended
extends Sprite2D

@export var sprite_resources : Array[Sprite_resource]

func _ready() -> void:
	for i in sprite_resources:
		if i != null:
			i._ready(self)
