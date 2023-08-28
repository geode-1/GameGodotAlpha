extends Control


signal next_level
signal return_to_menu


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$CoinStats.text = "Coins: " + str(GameTimer.coins)
	$TimeStats.text = "Time: " + GameTimer.high_score_timer


func _on_next_level_pressed():
	print("next level here")
	get_tree().change_scene_to_file("res://error_screen.tscn")
	GameTimer.coins = 0


func _on_level_selection_pressed():
	get_tree().change_scene_to_file("res://level_select_1.tscn")
	GameTimer.coins = 0


func _on_menu_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")
	emit_signal("return_to_menu")
	GameTimer.coins = 0


func _on_quit_pressed():
	get_tree().quit()
