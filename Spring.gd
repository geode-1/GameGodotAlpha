extends Area3D

# The path to the player scene.
var player = "res://Player.tscn"

# The force used for the bounce effect.
const BOUNCE_FORCE = 25

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.is_in_group("player"):
 # Apply the bounce effect to the player
		var player = body as CharacterBody3D
		if player != null:
 # Set the upward velocity to achieve the bounce effect
			player.velocity.y = lerp(BOUNCE_FORCE, 25, 0.4)
			$AnimationPlayer.play("sping_bounce")
		else:
			print("Player not found or is null.")



   
