@icon("res://addons/NZ_sprites_extended/Icons/SR_FR_percent.svg")
class_name SR_FR_percent
extends SR_frame_random

@export_range(0,1) var frame_percent : float = 0.5 ## chance to choose a random frame, otherwise will be a default one
@export_range(0,1) var flip_h_percent : float = 0.5
@export_range(0,1) var flip_v_percent : float = 0.5

func _check_if_can_choose_random_frame() -> bool:
	if frame_random and randf_range(0.0,1.0) <= frame_percent:
		return true
	return false

func _check_if_can_random_flip_h() -> bool:
	if flip_h_random and randf_range(0.0,1.0) <= flip_h_percent:
		return true
	return false

func _check_if_can_random_flip_v() -> bool:
	if flip_v_random and randf_range(0.0,1.0) <= flip_v_percent:
		return true
	return false
