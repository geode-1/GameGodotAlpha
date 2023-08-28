extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Label.text = "LVL1 =" + str(GameTimer.coins_lvl_1) + "LVL2 =" + str(GameTimer.coins_lvl_2)


func _on_tutorial_1_pressed():
	get_tree().change_scene_to_file("res://world_tutorial_1.tscn")


func _on_level_1_pressed():
	get_tree().change_scene_to_file("res://world_3.tscn")


func _on_level_2_pressed():
	pass # Replace with function body.


func _on_back_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")
