extends Node3D



var correct_words = ["Gold", "Cavern", "Chicken"]
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
			remove_wall(current_level)
			current_level += 1
			return
		else:
			if i == current_level:
				return
			else:
				index += 1

func remove_wall(level):
	if level == 0:
		print(level)
		$Environment/DisappearingWall1.position.y = 2.104
	if level == 1:
		print(level)
		$Environment/DisappearingWall2.position.y = 2.104
	if level == 2:
		print(level)
		$Environment/DisappearingWall3.position.y = 2.104
	
