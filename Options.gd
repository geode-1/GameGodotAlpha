extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#When button is pressed, chnage to World 1 scene
func _on_world_1_pressed():
	get_tree().change_scene_to_file("res://world.tscn")

#When button is pressed, chnage to World 2 scene
func _on_world_2_pressed():
	get_tree().change_scene_to_file("res://world_2.tscn")

#When button is pressed, chnage to World 3
func _on_world_3_pressed():
	get_tree().change_scene_to_file("res://world_3.tscn")

#When button is pressed, chnage back to the main menu 
func _on_back_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")
