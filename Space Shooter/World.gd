extends Node

var score = 0 setget set_score #this gets called everytime the variable changes

onready var scoreLabel = $ScoreLabel

func set_score(value):
	score = value
	update_score_label()

#func _on_Enemy_score_up():
#	self.score +=1 #needs self because to avoid looping

func update_score_label():
	scoreLabel.text = "Score= " + str(score) 

func update_save_data():
	var save_data = SaveAndLoad.load_data_from_file() #we get access because it's a singleton
	if score > save_data.highscore:
		save_data.highscore = score
		SaveAndLoad.save_data_to_file(save_data)

func _on_Ship_player_death():
	update_save_data()
	yield(get_tree().create_timer(1), "timeout") #create a timer and wait till its done
	get_tree().change_scene("res://GameOverScreen.tscn")
