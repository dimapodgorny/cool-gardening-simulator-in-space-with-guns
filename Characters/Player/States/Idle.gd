extends State

func enter() -> void: # Called when the state has been switched to
	pass
	
func exit() -> void: # Called when the state is switching to another state
	pass
	
func update(_delta: float) -> void: # Called every frame
	pass
	
func physics_update(_delta: float) -> void: # Called every physics tick
	if body.velocity:
		body.velocity = body.velocity / 2
		
	if !body.is_on_floor():
		transition.emit(self, "Fall")
		
	if body.direction:
		transition.emit(self, "Walk")
		return
		
	if Input.is_action_just_pressed("Jump"):
		transition.emit(self, "Jump")
		return
		
