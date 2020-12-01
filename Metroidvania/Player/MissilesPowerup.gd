extends Powerup #classnames can be used to extend

func _ready():
	if SaverAndLoader.custom_data.missiles_unlocked:
		queue_free() #deleting this powerup not the one saved

func _pickup():
	PlayerStats.missiles_unlocked = true
	queue_free()
