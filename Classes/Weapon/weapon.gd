extends Node3D
class_name Weapon

@export var hitscan : bool

@export var auto_fire : bool
@export var stats : WeaponStats

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var mesh: Node3D = $Mesh


var can_fire : bool = true

func _ready() -> void:
	pass
	
func fire() -> void:
	if !animation_player.is_playing():
		animation_player.play("Shoot")
	
