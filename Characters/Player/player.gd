extends Character
class_name Player

@export var debug_mode : bool = false

@onready var reach: RayCast3D = %Reach

var can_interact : bool = false
var input_dir : Vector2

var life_time : float

func _ready() -> void:
	if debug_mode:
		%debug_ui.process_mode = Node.PROCESS_MODE_INHERIT
	else:
		%debug_ui.queue_free()
		

func _process(delta: float) -> void:
	life_time += delta
	input_dir = Input.get_vector("Right", "Left", "Backward", "Forward")
	direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	if reach.is_colliding():
		if reach.get_collider() is InteractiveArea:
			can_interact = true
			if Input.is_action_pressed("Interact"):
				reach.get_collider().interacted.emit(self)
				
		elif reach.get_collider() is not InteractiveArea:
			can_interact = false
			
			
		
	
func _physics_process(_delta: float) -> void:
	move_and_slide()
	
	
