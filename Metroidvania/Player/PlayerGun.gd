extends Node2D


func _process(delta):
	var player = get_parent()
	rotation = player.get_local_mouse_position().angle() #this gets the angle of mouse position relative to the player
	
