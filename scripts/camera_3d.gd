extends Camera3D

var speed = 10.0
var mouse_sensitivity = 0.1
var yaw = 0.0
var pitch = 0.0

func _ready():
	position = Vector3(0, 10, 100)
	look_at(Vector3.ZERO, Vector3.UP)
	lock_cursor_to_screen_center()

func _input(event):
	if event is InputEventMouseMotion:
		look_around(event)

func _process(delta: float):
	var direction := get_direction_from_input()
	direction = normalize_and_escalate_direction(direction, delta)
	translate(direction)
		
func look_around(event: InputEventMouseMotion):
	yaw -= event.relative.x * mouse_sensitivity
	pitch -= event.relative.y * mouse_sensitivity
	pitch = clampf(pitch, -89, 89)
	rotation_degrees = Vector3(pitch, yaw, 0)
	
func lock_cursor_to_screen_center():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		
func get_direction_from_input() -> Vector3:
	var transforms := get_ui_vectors()
	var direction := Vector3()
	for ui_input in transforms:
		if Input.is_action_pressed(ui_input):
			direction += transforms[ui_input]
	return direction
		
func get_ui_vectors() -> Dictionary[String, Vector3]:
	var transforms: Dictionary[String, Vector3] = {
		"ui_up": Vector3.FORWARD,
		"ui_down": Vector3.BACK,
		"ui_left": Vector3.LEFT,
		"ui_right": Vector3.RIGHT
	}
	return transforms
	
func normalize_and_escalate_direction(direction: Vector3, delta: float) -> Vector3:
	return direction.normalized() * speed * delta
