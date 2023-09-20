extends Control

var current_coinstat_text = ""
var current_timestat_text = ""
var current_title_text = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Coin_Stats.text = str(current_coinstat_text)
	$Time_Stats.text = str(current_timestat_text)
	$lvl_title.text = str(current_title_text)
	
	
	if $MarginContainer/VBoxContainer/Tutorial_1.is_hovered():
		$Coin_Stats.text = "Level coins total: " + str(GameTimer.coins_lvl_1)
		$Time_Stats.text = "Best time: " + str(GameTimer.time_lvl_1)
		$lvl_title.text = "The Start"
		
		current_coinstat_text = $Coin_Stats.text
		current_timestat_text = $Time_Stats.text
		current_title_text = $lvl_title.text
		
		print("hovvering")
		
	if $MarginContainer/VBoxContainer/Level_1.is_hovered():
		$Coin_Stats.text = "Level coins total: " + str(GameTimer.coins_lvl_2)
		$Time_Stats.text = "Best time: " + str(GameTimer.time_lvl_2)
		$lvl_title.text = "The Change"
		
		current_coinstat_text = $Coin_Stats.text
		current_timestat_text = $Time_Stats.text
		current_title_text = $lvl_title.text
		
		
	if $MarginContainer/VBoxContainer/Level_2.is_hovered():
		$Coin_Stats.text = "Level coins total: " + str(GameTimer.coins_lvl_3)
		$Time_Stats.text = "Best time: " + str(GameTimer.time_lvl_3)
		$lvl_title.text = "The Bounce"
		
		current_coinstat_text = $Coin_Stats.text
		current_timestat_text = $Time_Stats.text
		current_title_text = $lvl_title.text
		
	if $MarginContainer/VBoxContainer/Level_3.is_hovered():
		$Coin_Stats.text = "Level coins total: " + str(GameTimer.coins_lvl_4)
		$Time_Stats.text = "Best time: " + str(GameTimer.time_lvl_4)
		$lvl_title.text = "The Key"
		
		current_coinstat_text = $Coin_Stats.text
		current_timestat_text = $Time_Stats.text
		current_title_text = $lvl_title.text
	
	$Label2.text = "total coints: " + str(GameTimer.total_coins)


func _on_tutorial_1_pressed():
	get_tree().change_scene_to_file("res://world_tutorial_1.tscn")


func _on_level_1_pressed():
	get_tree().change_scene_to_file("res://world_3.tscn")


func _on_level_2_pressed():
	pass # Replace with function body.
	

func _on_level_3_pressed():
	pass # Replace with function body.


func _on_back_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")


