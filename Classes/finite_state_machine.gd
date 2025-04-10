extends Node
class_name FiniteStateMachine

@export var initial_state : State
var current_state : State
var previous_state : State

var states : Dictionary[String, State] = { }

func _process(delta: float) -> void:
	if current_state:
		current_state.update(delta)
		
func _physics_process(delta: float) -> void:
	if current_state:
		current_state.physics_update(delta)

func _ready() -> void:
	@warning_ignore("inferred_declaration")
	for _child in get_children():
		if _child is State:
			states[_child.name.to_lower()] = _child
			_child.transition.connect(_transition)
			
	if initial_state:
		previous_state = initial_state
		initial_state.enter()
		current_state = initial_state

func _transition(_origin: State, new_state_name: String) -> void:
	var new_state : State
	new_state = states.get(new_state_name.to_lower())
	
	current_state.exit()
	previous_state = current_state
	current_state = new_state
	current_state.enter()
	
