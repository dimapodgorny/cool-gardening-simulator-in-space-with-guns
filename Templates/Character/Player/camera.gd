extends Camera3D

@export var sensivity : float = 0.003

func capture_mouse() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		owner.rotate_y(event.relative.x * -sensivity)
		rotation.x -= event.relative.y * sensivity
		rotation.x = clamp(rotation.x, -PI/2, PI/2)
		
		
func _ready() -> void:
	capture_mouse()
	
