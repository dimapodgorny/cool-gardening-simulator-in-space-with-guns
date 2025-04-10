extends Node
class_name State

@export var body_path_override : Character ## LEAVE THIS BLANK BY DEFAULT
@onready var body : Character = $"../.."
@onready var stats : CharacterStats = body.stats

@warning_ignore("unused_signal")
signal transition

func enter() -> void:
	pass
	
func exit() -> void:
	pass
	
@warning_ignore("unused_parameter")
func update(delta: float) -> void:
	pass
	
@warning_ignore("unused_parameter")
func physics_update(delta: float) -> void:
	pass
