extends KinematicBody2D

export (int) var base_speed = 200
export (int) var speed_multiplier = 2
export (int) var inertia = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	var movement = $MovementController.movement_direction

#	sprint code.
	var speed = base_speed
	if Input.is_action_pressed("player_sprint"):
		speed *= speed_multiplier

	for index in get_slide_count():
		var collision = get_slide_collision(index)
		if collision.collider is RigidBody2D:
			collision.collider.apply_central_impulse(-collision.normal * inertia)
		var interaction_target = $MovementController.destination_object
		if collision.collider is Harvestable and collision.collider == interaction_target:
			$MovementController.stop()
	if movement.x < 0:
		get_node("Sprite").flip_h = true
	elif movement.x > 0:
		get_node("Sprite").flip_h = false
	move_and_slide(movement * speed, Vector2(0,0), false, 4, PI/4, false)
