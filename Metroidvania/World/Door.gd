extends Area2D

export(Resource) var connection = null
export(String, FILE, "*.tscn") var new_level_path = "" #getting only scene files
var active = true

func _on_Door_body_entered(Player):
	if active == true:
		Player.emit_signal("hit_door", self) #sending the door we collided with
		active = false
