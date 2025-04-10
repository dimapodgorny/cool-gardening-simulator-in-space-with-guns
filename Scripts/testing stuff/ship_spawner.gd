@tool
extends InteractiveArea

@export var spawn_position : Vector3
@export var ship_path : PackedScene

@onready var ships: Node3D = %Ships

@onready var marker_3d: Marker3D = $Marker3D

func _ready() -> void:
	super ()
	if !Engine.is_editor_hint():
		marker_3d.queue_free()
	
func _process(delta: float) -> void:
	if Engine.is_editor_hint():
		marker_3d.global_position = spawn_position
	
func _on_interaction(interactor: Character) -> void:
	var ship_instance : Ship = ship_path.instantiate()
	ships.add_child(ship_instance)
	ship_instance.global_position = spawn_position
