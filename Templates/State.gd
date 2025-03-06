extends Node
class_name State

@onready var Body : Character = $"../../"
@onready var FSM: FiniteStateMachine = %"State Machine"

signal Transition
@warning_ignore("unused_signal") signal Transition_failed

func change_state(origin: State, new_state_name: String):
	Transition.emit(origin, new_state_name)

func enter() -> void:
	pass
	
func exit() -> void:
	pass
	
func update(_delta: float) -> void:
	pass
	
func physics_update(_delta: float) -> void:
	pass
