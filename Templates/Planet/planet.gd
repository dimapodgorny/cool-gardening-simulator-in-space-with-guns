extends Node3D
class_name Planet

@onready var sprites: AnimatedSprite3D = $Sprites

func _ready() -> void:
	sprites.fixed_size = false
	
