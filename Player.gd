extends CharacterBody3D


#Varibles for  player movement and physics
@export var default_speed = 10
var jump_velocity = 6.5
@export var sprint_speed = 15.0
var speed = default_speed
var climb_speed = 5.0
var gravity_changed = false
var dead = false
var coin_counter = 0


#Varibles for climbing 
var still_on_wall = false
@onready var wall_raycasts = $wall_raycasts
@onready var wall_check = $wall_raycasts/wall_check
@onready var still_on_wall_check = $wall_raycasts/still_on_wall_check
var climbing = false

#Varibles for jumping physics
var total_jumps = 0
var normal_gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var gravity_enabled = true

var player = "res://Player.tscn"


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = normal_gravity

# References to the player's camera and its collision check.
@onready var CameraBase = $CameraBase
@onready var camera_col = $CameraBase/camera_collisionnew
@onready var camera = $CameraBase/Camera3D


func _ready():
	pass



func _input(event):
	if event is InputEventMouseMotion:
		# Mouse input for camera control.
		CameraBase.rotation.x -= deg_to_rad(event.relative.y * 1) 
		CameraBase.rotation.x = clamp(CameraBase.rotation.x, deg_to_rad(-90), deg_to_rad(30))
		rotation.y -= deg_to_rad(event.relative.x * 1)
		


func death():
	# Transition to the game over scene and manage the mouse cursor.
	get_tree().change_scene_to_file("res://game_over.tscn")
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	dead = true

func _physics_process(delta):
	
	print(GameTimer.can_platform_change)
	
	# Handle camera collision with obstacles.
	if $CameraBase/camera_collision.is_colliding():
		camera.global_transform.origin = lerp(camera.global_transform.origin, $CameraBase/camera_collision.get_collision_point(), 0.2)
	else:
		camera.global_transform.origin = $CameraBase/Node3D.global_transform.origin



	#Gravity handling
	if not is_on_floor():
		velocity.y -= gravity * delta
		GameTimer.can_platform_change = false
		
	if is_on_floor():
		GameTimer.can_platform_change = true
		$CPUParticles3D.emitting = false


		# Jumping logic.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity
		total_jumps = 1
		$CPUParticles3D.emitting = true
		
		
		# Double jump logic.
	if Input.is_action_just_pressed("jump") and not is_on_floor() and total_jumps == 1:
		velocity.y = jump_velocity
		total_jumps = 2
		$CPUParticles3D.emitting = true

		if $floor_raycasts/floor_raycast.is_colliding():
			#GameTimer.can_platform_change = true
			print("onfloor")
		

	# Player movement and speed
	# Get the input direction and handle the movement/deceleration.
	var input_dir = Input.get_vector("move_left", "move_right", "move_foward", "move_backward")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()

	if direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)


	# Sprinting.
	if Input.is_action_pressed("move_sprint"):
		speed = sprint_speed
		$CPUParticles3D.emitting = true
	else:
		speed = default_speed
		$CPUParticles3D.emitting = false
		
		
		
	# Menu and quit actions.
	if Input.is_action_just_pressed("menu"):
		get_tree().change_scene_to_file("res://menu.tscn")
		
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
		
	if Input.is_action_just_pressed("change_aspect"):
		if Input.MOUSE_MODE_HIDDEN:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		if Input.MOUSE_MODE_VISIBLE:
			Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	


	# Climbing logic.
	if $wall_raycasts/wall_check.is_colliding() and not is_on_floor():

		gravity_enabled = false
		velocity.y = 0
		print("wallColide")

		if Input.is_action_pressed("move_foward"):
		# Calculate the movement vector
			var movement = Vector3(direction.x, 0, direction.z).normalized() * climb_speed
			velocity.x = movement.x
			velocity.z = movement.z
			velocity.y = climb_speed
			climbing = true
			


		elif Input.is_action_pressed("move_backward"):
			var movement = Vector3(direction.x, 0, direction.z).normalized() * climb_speed
			velocity.x = movement.x
			velocity.z = movement.z
			velocity.y = -climb_speed
			climbing = true
			
			
	
			
		else:
		# Reset the vertical (Y) velocity to prevent automatic upward movement
			if not climbing:
				velocity.y = 0
				climbing = false


		# Reset velocity to prevent drifting when not climbing
		if not wall_check.is_colliding():
			velocity.x = 0
			velocity.z = 0
		


	else:
		gravity_enabled = true

	

	move_and_slide()



func _on_death_zone_area_entered(area):
	death()

func _on_end_deathzone_area_entered(area):
	death()


func on_level_complete():
	GameTimer.reset_coins()


