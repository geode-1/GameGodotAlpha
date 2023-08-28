extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	GameTimer.prev_scene = "res://world_tutorial_1.tscn"
	
	GameTimer.coins_lvl_1 = GameTimer.coins
