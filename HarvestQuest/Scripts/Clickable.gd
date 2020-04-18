extends CollisionObject2D
class_name Clickable

var _mouse_over = false

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("mouse_entered", self, "_mouse_entered")
	connect("mouse_exited",  self, "_mouse_exited")

func _mouse_entered():
	_mouse_over = true
	
func _mouse_exited():
	_mouse_over = false

func _exit_tree():
	print("removed")

func _unhandled_input(event):
	if _mouse_over:
		if event is InputEventMouseButton:
			get_tree().set_input_as_handled()
			if event.is_pressed():
				_clicked(event.button_index)
			else:
				_click_released(event.button_index)
#		elif event is InputEventScreenTouch:
#			TODO: Make it detect touch screen

func _clicked(button_index):
	pass

func _click_released(button_index):
	pass
