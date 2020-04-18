extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	InputManager.connect("ground_targeted", self, "_set_waypoint")

func _set_waypoint(point, button):
	position = point
