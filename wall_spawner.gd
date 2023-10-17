extends Node3D



# The scene for the wall object to spawn.
@export var wall_object = preload("res://move_wall.tscn")




# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Spawns a wall object in the scene.
func spawn_platform():
	var object = wall_object.instantiate()
	add_child(object)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	spawn_platform()


