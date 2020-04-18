extends Clickable
class_name Harvestable

export (String) var harvest_action = "None given"

func _ready():
	add_to_group("Interactables")

func _exit_tree():
	remove_from_group("Interactables")
	print("removed")

func _clicked(button_index):
	if button_index == BUTTON_LEFT:
		InputManager.set_new_target_object(self)
