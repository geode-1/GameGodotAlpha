extends StaticBody3D



# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. delta is the elapsed time since the previous frame.
func _process(delta):
	
		#Checks if the platforms are alowed to change 
		if Input.is_action_just_pressed("jump") and GameTimer.can_platform_change == true:
			if collision_layer:
				# Set collision layers to make the platform solid.
				set_collision_layer_value(2, false)
				set_collision_layer_value(4, false)
				$AnimationPlayer.play_backwards("become_solid")
				$change_platforms_red.visible = false
				$change_platforms_redT3.visible = true
				
				
			else:
				# Set collision layers to make the platform transparent.
				set_collision_layer_value(2, true)
				set_collision_layer_value(4, true)
				$AnimationPlayer.play("become_solid")
				$change_platforms_red.visible = true
				$change_platforms_redT3.visible = false


