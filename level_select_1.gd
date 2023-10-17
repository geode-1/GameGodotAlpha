extends Control

# Variables to store and display text data
var current_coinstat_text = ""
var current_timestat_text = ""
var current_title_text = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Update the UI text labels with the current data
	$Coin_Stats.text = str(current_coinstat_text)
	$Time_Stats.text = str(current_timestat_text)
	$lvl_title.text = str(current_title_text)
	
	# Check for hovering over button and update the UI accordingly
	if $MarginContainer/VBoxContainer/Tutorial_1.is_hovered():
		$Coin_Stats.text = "Level coins total: " + str(GameTimer.coins_lvl_1)
		$Time_Stats.text = "Best time: " + str(GameTimer.time_lvl_1)
		$lvl_title.text = "The Start"
		
		# Update the current text data
		current_coinstat_text = $Coin_Stats.text
		current_timestat_text = $Time_Stats.text
		current_title_text = $lvl_title.text
		
		print("hovvering")
		
	# Check for hovering over button and update the UI accordingly
	if $MarginContainer/VBoxContainer/Level_1.is_hovered():
		$Coin_Stats.text = "Level coins total: " + str(GameTimer.coins_lvl_2)
		$Time_Stats.text = "Best time: " + str(GameTimer.time_lvl_2)
		$lvl_title.text = "The Change"
		
		# Update the current text data
		current_coinstat_text = $Coin_Stats.text
		current_timestat_text = $Time_Stats.text
		current_title_text = $lvl_title.text
		
	# Check for hovering over button and update the UI accordingly
	if $MarginContainer/VBoxContainer/Level_2.is_hovered():
		$Coin_Stats.text = "Level coins total: " + str(GameTimer.coins_lvl_3)
		$Time_Stats.text = "Best time: " + str(GameTimer.time_lvl_3)
		$lvl_title.text = "The Bounce"
		
		# Update the current text data
		current_coinstat_text = $Coin_Stats.text
		current_timestat_text = $Time_Stats.text
		current_title_text = $lvl_title.text
		

		

	



func _on_tutorial_1_pressed():
	#When button is pressed, chnage to "world_tutorial_1.tscn"
	get_tree().change_scene_to_file("res://world_tutorial_1.tscn")


func _on_level_1_pressed():
	#When button is pressed, chnage to "world_3.tscn"
	get_tree().change_scene_to_file("res://world_3.tscn")


func _on_level_2_pressed():
	#When button is pressed, chnage to "level_2.tscn"
	get_tree().change_scene_to_file("res://level_2.tscn")
	

func _on_level_3_pressed():
	pass # Replace with function body.


func _on_back_pressed():
	#When button is pressed, chnage to main menu
	get_tree().change_scene_to_file("res://menu.tscn")


