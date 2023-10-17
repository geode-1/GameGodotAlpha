extends Label

var game_timer = preload("res://GameTimer.gd")

# Variables to track time.
var time_elapsed := 0.0
var minutes = 0
var seconds = 0
var milliseconds = 0 
 



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	# Update the elapsed time.
	time_elapsed += delta

	# Calculate minutes, seconds, and milliseconds.
	minutes = int(time_elapsed / 60)
	seconds = int(fmod(time_elapsed, 60))
	milliseconds = int(fmod(time_elapsed, 1) * 1000)
	
	# Convert the time components to formatted strings.
	var minutes_str := str(minutes).pad_zeros(2)
	var seconds_str := str(seconds).pad_zeros(2)
	var milliseconds_str := str(milliseconds).pad_zeros(2).right(2)

	
	# Update the label text with the formatted time.
	$".".text = "Time: " + minutes_str + ":" + seconds_str + ":" + milliseconds_str


	# Update the best time in the GameTimer script.
	GameTimer.best_time_timer = minutes_str + ":" + seconds_str + ":" + milliseconds_str

	



	
