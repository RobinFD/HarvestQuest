extends Node2D

signal object_targeted
signal ground_targeted

func _ready():
	pass # Replace with function body.

func set_new_target_object(target):
	emit_signal("object_targeted", target)

func ground_point_clicked(button_index):
	emit_signal("ground_targeted", get_global_mouse_position(), button_index)
