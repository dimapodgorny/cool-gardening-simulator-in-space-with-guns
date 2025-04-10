extends State

@export var jump_delay : float = 0.05
var time_until_jump


func enter() -> void: # Called when the state has been switched to
	time_until_jump = jump_delay
	body.velocity.y = body.stats.jump_strength
	
func exit() -> void: # Called when the state is switching to another state
	pass
	
func update(delta: float) -> void: # Called every frame
	pass
	
func physics_update(delta: float) -> void: # Called every physics tick
	body.apply_gravity(delta)
	
	if body.is_on_floor():
		if body.input_dir:
			transition.emit(self, "Walk")
		else:
			transition.emit(self, "Idle")
			return
		
	
	if body.velocity.y < 0:
		transition.emit(self, "Fall")
		return
	
	
	
