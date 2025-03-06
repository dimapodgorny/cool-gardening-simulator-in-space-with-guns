extends State


func enter():
	print("jumping!")
	Body.velocity.y = Body.jump_strength
	call_deferred("change_state", self, "Idle")
	
func exit():
	pass
	
