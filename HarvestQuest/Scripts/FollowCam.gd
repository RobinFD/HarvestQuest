extends Camera2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (NodePath) var target
export (float) var factor = 1
export(int) var offset_x = 0
export(int) var offset_y = 0

var target_node 

# Called when the node enters the scene tree for the first time.
func _ready():
	target_node = get_node(target)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x = lerp(position.x, target_node.position.x + offset_x, delta * factor)
	position.y = lerp(position.y, target_node.position.y + offset_y, delta * factor)
