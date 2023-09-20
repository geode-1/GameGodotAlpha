extends Node

var list_lvl = ["res://world_tutorial_1.tscn", "res://world_3.tscn", "res://level_2.tscn"]


var best_time_timer = 0

var can_platform_change = true

var coins = 0

#levels coin counters --------------------
var coins_lvl_1 = 0
var coins_lvl_2 = 0
var coins_lvl_3 = 0
var coins_lvl_4 = 0

var total_coins = coins_lvl_1 + coins_lvl_2 + coins_lvl_3 + coins_lvl_4

#levels coin counters --------------------

var levels_list = ["res://world_tutorial_1.tscn", "res://world_3.tscn"]

var prev_scene = "res://error_screen.tscn"
var next_scene = "res://error_screen.tscn"



#levels time score ---------------------

var time_lvl_1 = 0
var time_lvl_2 = 0
var time_lvl_3 = 0
var time_lvl_4 = 0



#levels time score ---------------------

func reset_coins():
	coins = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _on_next_level():
	reset_coins()

func _on_return_to_menu():
	reset_coins()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


