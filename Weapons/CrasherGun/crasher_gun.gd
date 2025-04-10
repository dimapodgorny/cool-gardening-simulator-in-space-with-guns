extends Weapon

var fired: bool = false
var time_until_detonation : float = 1.0

@onready var player: Player = $"../.."

@onready var collision_shape_3d: CollisionShape3D = $Area3D/CollisionShape3D
@onready var area_3d: Area3D = $Area3D

@export var crashes_game: bool = true
@export var knockback_velocity : float = 343.2

func fire() -> void:
	fired = true
	animation_player.play("CrasherGun/Shoot")
	area_3d.process_mode = Node.PROCESS_MODE_ALWAYS
	
	
	var custom_inp_dir : Vector2 = Vector2(0, -1)
	var custom_dir : Vector3 = (player.transform.basis * Vector3(custom_inp_dir.x, 0, custom_inp_dir.y)).normalized()
	%"State Machine".process_mode = Node.PROCESS_MODE_DISABLED
	player.velocity.x = custom_dir.x * knockback_velocity
	player.velocity.z = custom_dir.z * knockback_velocity
	
	
func _process(delta: float) -> void:
	if fired:
		if crashes_game:
			if Engine.max_fps > 60 or Engine.max_fps == 0:
				Engine.max_fps = 60.0
			Engine.max_fps *= 0.65
			
			time_until_detonation -= delta
			
			if time_until_detonation < 0:
				player.queue_free()
				get_tree().quit()
	
