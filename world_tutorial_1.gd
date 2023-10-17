extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	GameTimer.prev_scene = "res://world_tutorial_1.tscn"
	
	GameTimer.next_scene = "res://world_3.tscn"
	

	
	#personal best store



func _on_goal_area_entered(area):
	#Saving coins
	GameTimer.coins_lvl_1 = GameTimer.coins
		#Saving time based on if the time is lower or higher than the curently saved time
	if int(GameTimer.time_lvl_1) <= int(GameTimer.best_time_timer):
		GameTimer.time_lvl_1 = GameTimer.best_time_timer
