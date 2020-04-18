extends Navigation2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			InputManager.ground_point_clicked(event.button_index)
	elif event is InputEventScreenTouch:
		pass
