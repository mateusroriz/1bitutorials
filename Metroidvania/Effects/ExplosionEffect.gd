extends Node2D


func _ready():
	SoundFx.play("Explosion", 0.6, rand_range(0.6, 1.0))
