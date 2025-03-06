extends Node

var planet_paths : Dictionary = {
	"base planet": "res://Templates/Planet/Planet.tscn"
	}

var station_paths : Dictionary = {
	"base station": "res://Templates/Station/Space Station.tscn"
}

var current_station : SpaceStation

var player_template := "res://Templates/Character/Player/player.tscn"
