extends CharacterBody3D

@onready var camera_3d = $Camera3D

const SPEED = 5.0
const JUMP_VELOCITY = 4.5
const CAMERA_SENS = .05

var look_dir: Vector2

func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("Move Left", "Move Right", "Move Forward", "Move Back")
	var direction: Vector3 = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)


	if Input.is_action_pressed("Camera Left"):
		rotation.y += .05
	if Input.is_action_pressed("Camera Right"):
		rotation.y -= .05
	if Input.is_action_pressed("Camera Up"):
		$Camera3D.rotate_x(.04)
	if Input.is_action_pressed("Camera Down"):
		$Camera3D.rotate_x(-.04)


	move_and_slide()
