extends Area3D
class_name InteractiveArea


signal interacted(interactor: Character)

func _ready() -> void:
	interacted.connect(_on_interaction)
	
	
func _on_interaction(interactor: Character) -> void:
	print(interactor, " interacted with ", self)
