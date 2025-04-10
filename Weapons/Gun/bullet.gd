extends RigidBody3D
class_name Bullet
const velocity : float = 40.0

@onready var mesh: MeshInstance3D = $MeshInstance3D
@onready var hit_cast: RayCast3D = $HitCast
#@onready var particles: GPUParticles3D = $GPUParticles3D

@export var bullet_speed : float = 40.0

func _ready() -> void:
	linear_velocity = global_transform.basis * Vector3(0, 0, bullet_speed)
	
func _physics_process(delta: float) -> void:
	if hit_cast.is_colliding():
		mesh.visible = false
		#particles.emitting = true
		queue_free()
		#await get_tree().create_timer(1.0).timeout
		
func _on_timer_timeout() -> void:
	queue_free()
