extends State

func enter() -> void:
	print("idling...")
	
func exit() -> void:
	pass
	
func update(delta: float) -> void:
	pass
	
func physics_update(delta: float) -> void:
	if Body.direction:
		change_state(self, "Run")
		
	if Input.is_action_just_pressed("Jump"):
		change_state(self, "Jump")
		
