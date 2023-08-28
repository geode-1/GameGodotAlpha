extends StaticBody3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_vision_timer_timeout():
	var overlaps = $VisionArea.get_overlapping_bodies()
	if overlaps.size() > 0:
		for overlap in overlaps:
			if overlap.name == "Player":
				var plyerPosition = overlap.global_transform.origin
				$VisionRayCast.look_at(plyerPosition, Vector3.UP)
				$VisionRayCast.force_raycast_update()
				
				if $VisionRayCast.is_colliding():
					var collider = $VisionRayCast.get_collider()
					
					if collider.name == "Player":
						$VisionRayCast.debug_shape_custom_color = Color(174, 0, 0)
						print("I see you")
						
					else:
						$VisionRayCast.debug_shape_custom_color = Color(0, 255, 0)
						print("I dont see you")
