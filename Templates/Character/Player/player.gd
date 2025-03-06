extends Character
class_name Player

var input_direction : Vector2

func _process(delta: float) -> void:
	input_direction = Input.get_vector("Left", "Right", "Forward", "Backward")
	direction = (transform.basis * Vector3(input_direction.x, 0, input_direction.y)).normalized()
	
	velocity += get_gravity()
	
	move_and_slide()
	
var sigma : String = "hi"
