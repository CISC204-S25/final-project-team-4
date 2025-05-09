extends Node3D



var correct_words = ["FirstWord", "SecondWord", "ThirdWord"]
var current_level = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	SignalBus.connect("checkCode", check_code)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Checks the code that the player inputs and checks against the correct_words array
func check_code(text):
	var index = current_level
	for i in range(current_level, 3, 1):
		if text == correct_words[i]:
			print("Correct!")
			current_level += 1
			return
		else:
			if i == current_level:
				return
			else:
				index += 1
