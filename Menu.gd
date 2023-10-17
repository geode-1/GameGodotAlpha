extends Control

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

#When button is pressed, chnage to "level_select_1" scene
func _on_play_pressed():
	get_tree().change_scene_to_file("res://level_select_1.tscn")
	
	

#When button is pressed, quit game
func _on_quit_pressed():
	get_tree().quit()

#When button is pressed, chnage to the "options" scene
func _on_other_prototypes_pressed():
	get_tree().change_scene_to_file("res://options.tscn")
