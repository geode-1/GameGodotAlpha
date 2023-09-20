extends StaticBody3D



# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. delta is the elapsed time since the previous frame.
func _process(delta):
	
	#if GameTimer.can_platform_change == true:
		if Input.is_action_just_pressed("jump"):
			if collision_layer:
				set_collision_layer_value(2, false)
				set_collision_layer_value(4, false)
				$AnimationPlayer.play_backwards("become_solid")
				
			else:
				set_collision_layer_value(2, true)
				set_collision_layer_value(4, true)
				$AnimationPlayer.play("become_solid")


