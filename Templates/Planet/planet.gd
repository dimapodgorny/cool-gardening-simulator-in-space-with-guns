extends Node3D
class_name Planet

@onready var sprites: AnimatedSprite3D = $Sprites

func _ready() -> void:
	sprites.billboard = BaseMaterial3D.BILLBOARD_ENABLED
	sprites.fixed_size = true
