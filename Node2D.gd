extends Node2D

onready var smrt = $canvas/SMRT


func _ready():
	smrt.show_text("hola", "hola")
