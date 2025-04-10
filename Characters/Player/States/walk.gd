extends State

func enter() -> void: # Called when the state has been switched to
	pass
	
func exit() -> void: # Called when the state is switching to another state
	pass
	
func update(_delta: float) -> void: # Called every frame
	pass
	
func physics_update(delta: float) -> void: # Called every physics tick
	if body.input_dir:
		body.velocity.x = move_toward(body.velocity.x, body.direction.x * stats.move_speed, stats.move_speed / 2)
		body.velocity.z = move_toward(body.velocity.z, body.direction.z * stats.move_speed, stats.move_speed / 2)
		
	else:
		transition.emit(self, "Idle")
		return
		
	if Input.is_action_just_pressed("Jump"):
		transition.emit(self, "Jump")
		return
		
	if !body.is_on_floor():
		transition.emit(self, "Fall")
	
