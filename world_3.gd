extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	GameTimer.prev_scene = "res://world_3.tscn"
	
	GameTimer.coins_lvl_2 = GameTimer.coins

