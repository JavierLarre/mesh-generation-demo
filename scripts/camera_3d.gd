extends Camera3D

var speed = 10.0
var mouse_sensitivity = 0.1
var yaw = 0.0
var pitch = 0.0

func _ready():
	self.position = Vector3(0, 10, 100)
	self.look_at(Vector3(0, 0, 0), Vector3.UP)
	# Lock the mouse cursor to the center of the screen
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	# Handle mouse motion for looking around
	if event is InputEventMouseMotion:
		yaw -= event.relative.x * mouse_sensitivity
		pitch -= event.relative.y * mouse_sensitivity
		pitch = clamp(pitch, -89, 89)
		rotation_degrees = Vector3(pitch, yaw, 0)
		

func _process(delta):
	var direction = Vector3()
	
	# Movement controls (WASD)
	if Input.is_action_pressed("ui_up"):
		direction -= transform.basis.z
	if Input.is_action_pressed("ui_down"):
		direction += transform.basis.z
	if Input.is_action_pressed("ui_left"):
		direction -= transform.basis.x
	if Input.is_action_pressed("ui_right"):
		direction += transform.basis.x

	# Normalize direction and apply movement
	if direction.length() > 0:
		direction = direction.normalized() * speed * delta
		translate(direction)
