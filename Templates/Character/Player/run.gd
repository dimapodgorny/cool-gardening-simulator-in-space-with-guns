extends State

func enter() -> void:
	print("running!")
	
func exit() -> void:
	pass
	
func update(delta: float) -> void:
	pass
	
func physics_update(delta:float) -> void:
	if Body.is_on_floor():
		if !Body.direction:
			change_state(self, "Idle")
		Body.velocity.x = Body.direction.x * Body.move_speed
		Body.velocity.z = Body.direction.z * Body.move_speed
	if Input.is_action_just_pressed("Jump"):
		change_state(self, "Jump")
