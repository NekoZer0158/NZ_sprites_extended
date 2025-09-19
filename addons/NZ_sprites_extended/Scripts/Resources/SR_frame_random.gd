@icon("res://addons/NZ_sprites_extended/Icons/SR_frame_random.svg")
class_name SR_frame_random
extends Sprite_resource

@export var exclude_frames : Array[int]
@export var frame_random : bool = true
@export var flip_h_random : bool = false
@export var flip_v_random : bool = false

var has_excluded_frames:
	get():
		if exclude_frames.size() == 0:
			return false
		else:
			return true

func _ready(sprite:Node) -> void:
	if _check_if_this_is_a_sprite(sprite):
		if _check_if_can_choose_random_frame():
			pick_random_frame(sprite)
		if _check_if_can_random_flip_h():
			sprite.flip_h = [true,false].pick_random()
		if _check_if_can_random_flip_v():
			sprite.flip_v = [true,false].pick_random()

func pick_random_frame(sprite:Node) -> void:
	var frames_amount : int = sprite.hframes*sprite.vframes
	if exclude_frames.size() == 0:
		sprite.frame = randi_range(0,frames_amount-1)
	else:
		var included_frames : Array[int] = []
		for i in range(0,frames_amount):
			if not i in exclude_frames:
				included_frames.append(i)
		sprite.frame = included_frames.pick_random()

func _check_if_can_choose_random_frame() -> bool:
	if frame_random:
		return true
	return false

func _check_if_can_random_flip_h() -> bool:
	if flip_h_random:
		return true
	return false

func _check_if_can_random_flip_v() -> bool:
	if flip_v_random:
		return true
	return false
