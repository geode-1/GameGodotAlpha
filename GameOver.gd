extends Control

var game_timer = preload("res://GameTimer.gd")

# Retrieve the saved time value
'var saved_time = game_timer.saved_time'


# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$CoinStats.text = "Coins: " + str(GameTimer.coins)
	$PersonalBest.text = "Personal Best: " + str(GameTimer.best_time_timer)


func _on_go_menu_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	GameTimer.coins = 0


func _on_play_again_pressed():
	get_tree().change_scene_to_file(GameTimer.prev_scene)
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	GameTimer.coins = 0


func _on_quit_pressed():
	get_tree().quit()
