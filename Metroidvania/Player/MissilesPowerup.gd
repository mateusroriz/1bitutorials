extends Powerup #classnames can be used to extend

func _pickup():
	PlayerStats.missiles_unlocked = true
	queue_free()
