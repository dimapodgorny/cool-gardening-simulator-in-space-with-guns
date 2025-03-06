extends CharacterBody3D
class_name Character

@export var move_speed : float = 5.0
@export var max_oxygen : float = 100.0
@export var jump_strength : float = 100.0

var direction : Vector3
var is_floating : bool = true

func _physics_process(delta: float) -> void:
	move_and_slide()
