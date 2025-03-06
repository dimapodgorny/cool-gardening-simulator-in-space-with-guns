extends Node
class_name FiniteStateMachine


@export var initial_state : State
var current_state : State
var previous_state : State

var states : Dictionary = { }
const ILLEGAL_STATES : Dictionary = {}

func _ready() -> void:
	for child in get_children():
		if child is State:
			states[child.name] = child
			child.Transition.connect(_transition)
			
	if initial_state:
		initial_state.enter()
		current_state = initial_state
		

func _process(delta: float) -> void:
	current_state.update(delta)
	
func _physics_process(delta: float) -> void:
	current_state.physics_update(delta)

func _transition(origin, new_state_name) -> void:
	if new_state_name in ILLEGAL_STATES:
		printerr("Aborting transition. ", new_state_name, " is illegal.")
		return
		
	if origin != current_state:
		printerr("Original state (", origin.name, ") is not the current state.")
		return
	
	
	var new_state = states.get(new_state_name)
	if not new_state is State:
		printerr("New state is not of type 'State")
		return
	
	if current_state:
		current_state.exit()
		
	new_state.enter()
	previous_state = current_state
	current_state = new_state
