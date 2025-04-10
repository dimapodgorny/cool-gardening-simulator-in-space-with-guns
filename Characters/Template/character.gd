extends CharacterBody3D
class_name Character

@export var stats : CharacterStats

@export_category("Inventory")

var current_speed : float

var is_dead : bool = false


var can_dash : bool
var can_jump : bool

var direction : Vector3

func apply_gravity(delta: float, multiplier : float = 2.0, custom_vector : Vector3 = Vector3.ZERO) -> void:
	if custom_vector != Vector3.ZERO:
		velocity += get_gravity() * multiplier * custom_vector * delta
	else:
		velocity += get_gravity() * multiplier * delta
	#print(velocity.length())
