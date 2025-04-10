extends Node3D
class_name WeaponManager

@export var Slot1 : Weapon
@export var Slot2 : Weapon
@export var Slot3 : Weapon

var current_weapon : Weapon
signal change_weapon(new_wep: Weapon)

func _ready() -> void:
	current_weapon = Slot1
	if Slot2:
		Slot2.visible = false
	if Slot3:
		Slot3.visible = false
	change_weapon.connect(_on_weapon_change)
	
	change_weapon.emit(Slot1)
	
	
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("Slot 1"):
		change_weapon.emit(Slot1)
	elif Input.is_action_just_pressed("Slot 2"):
		change_weapon.emit(Slot2)
	elif Input.is_action_just_pressed("Slot 3"):
		change_weapon.emit(Slot3)
		
func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("Fire"):
		if current_weapon.can_fire:
			current_weapon.fire()
	
func _on_weapon_change(new_weapon: Weapon) -> void:
	if !current_weapon:
		return
		
	if current_weapon == new_weapon:
		return
		
	if !new_weapon:
		return
		
	current_weapon.visible = false
	
	current_weapon = new_weapon
	current_weapon.visible = true
	
	
	
