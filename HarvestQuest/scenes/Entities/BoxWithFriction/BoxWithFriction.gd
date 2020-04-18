extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (float) var air_friction = 100
export (float) var air_angular_friction = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	var slowing_factor = air_friction * delta

	if abs(linear_velocity.length()) > slowing_factor:
		linear_velocity *= (1 - slowing_factor/linear_velocity.length())
	elif(linear_velocity.length() > 0):
		linear_velocity = Vector2(0,0)

	var angular_slowing_factor = air_angular_friction * delta
	if abs(angular_velocity) > angular_slowing_factor:
		angular_velocity *= (1 - angular_slowing_factor/abs(angular_velocity))
	else:
		angular_velocity = 0
