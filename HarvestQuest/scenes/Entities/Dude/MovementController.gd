extends Node

var movement_direction = Vector2(0,0)
export (int) var arrival_distance = 2
var destination_object
var moving = false
var nav2d : Navigation2D

# Called when the node enters the scene tree for the first time.
func _ready():
	var got_nav2d = false
	var current_node = get_parent()
	while !got_nav2d && current_node != null:
		if current_node is Navigation2D:
			nav2d = current_node
			got_nav2d = true
		current_node = current_node.get_parent() 
	destination_object = $Waypoint
	InputManager.connect("object_targeted", self, "_set_destination_target")
	InputManager.connect("ground_targeted", self, "_set_ground_as_destination")


func _set_destination_target(target):
	_set_destination(target)
	$Waypoint.hide()

func _set_ground_as_destination(point, button_index):
	$Waypoint.position = point
	_set_destination($Waypoint)
	$Waypoint.show()


func _set_destination(target):
	moving = true
	destination_object = target

func stop():
	movement_direction = Vector2(0,0)
	moving = false
	$Waypoint.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !moving:
		return
	var parent_position = get_parent().position
	var destination = destination_object.position
	var distance_vector = destination - parent_position
	if distance_vector.length() < arrival_distance:
		stop()
	else:
		movement_direction = distance_vector.normalized()
