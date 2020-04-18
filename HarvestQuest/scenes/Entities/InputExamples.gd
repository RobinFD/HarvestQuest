extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var input_stick: Vector2
	input_stick.x = Input.get_action_strength("player_right") - Input.get_action_strength("player_left")
	input_stick.y = Input.get_action_strength("player_down") - Input.get_action_strength("player_up")
	input_stick = input_stick.normalized()
	pass
