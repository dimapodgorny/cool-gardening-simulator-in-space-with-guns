extends State

func enter() -> void: # Called when the state has been switched to
	pass
	
func exit() -> void: # Called when the state is switching to another state
	pass
	
func update(_delta: float) -> void: # Called every frame
	pass
	
func physics_update(delta: float) -> void: # Called every physics tick
	body.apply_gravity(delta)
	
	if body.is_on_floor():
		transition.emit(self, "Idle")
		return
