extends SubViewport

@export var player : Player
@onready var state_machine: FiniteStateMachine = %"State Machine"
@onready var weapon_manager: WeaponManager = %"Weapon Manager"

## States
@onready var current_state: Label = $VBoxContainer/CurrentState/HBoxContainer/Value
@onready var previous_state: Label = $VBoxContainer/PreviousState/HBoxContainer/Value

## Movement
@onready var player_velocity: Label = $VBoxContainer/MovementSpeed/HBoxContainer/Value

## Equipment
@onready var equipped: Control = $VBoxContainer/Equipped/HBoxContainer/Value

## Data
@onready var Reach: Label = $VBoxContainer/Reach/HBoxContainer/Value


func _ready() -> void:
	var resolution = DisplayServer.window_get_size()
	size = resolution
	print("hi")
	

func _process(delta: float) -> void:
	## Update states
	current_state.text = state_machine.current_state.name
	previous_state.text = state_machine.previous_state.name
	
	player_velocity.text = str("%0.2f" % player.velocity.length(), "m/s")
	
	## Equipment
	equipped.text = str(weapon_manager.current_weapon.name)
	
	## Player data
	Reach.text = str(player.reach.get_collider())
