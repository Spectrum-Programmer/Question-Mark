extends Node2D

const AMOUNT_OF_LEVELS = 4

var latest_level : int = -1
var current_level : int = -1

var levels : Array[PackedScene] = []

func _ready() -> void:
	levels.resize(AMOUNT_OF_LEVELS)
