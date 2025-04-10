extends Camera3D
class_name PlayerCamera

@onready var player: Player = $"../.."
@onready var cam_pivot: Node3D = %CameraPivot

@export var camera_sensivity : float = 1.0

@export var capture_cursor : bool = true

func _ready() -> void:
	if capture_cursor:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("Options"):
		capture_cursor = !capture_cursor
		if capture_cursor:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		elif !capture_cursor:
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		player.rotate_y(-deg_to_rad(event.relative.x * camera_sensivity))
		rotate_x(-deg_to_rad(event.relative.y * camera_sensivity))
		rotation.x = clamp(rotation.x, -PI/2, PI/2)
