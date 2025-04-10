extends Weapon

@export var bullet_scene : PackedScene
var bullet_path

var bullet_instance : Bullet

@onready var barrel: RayCast3D = $Barrel

func fire() -> void:
	animation_player.play("Shoot")
	
	bullet_instance = bullet_scene.instantiate()
	bullet_instance.position = barrel.global_position
	bullet_instance.transform.basis = barrel.global_transform.basis
	
	get_tree().get_first_node_in_group("Projectiles").add_child(bullet_instance)
