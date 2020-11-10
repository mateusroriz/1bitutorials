extends Node

var score = 0 setget set_score #this gets called everytime the variable changes

onready var scoreLabel = $ScoreLabel

func set_score(value):
	score = value
	scoreLabel.text = "Score= " + str(score) 

#func _on_Enemy_score_up():
#	self.score +=1 #needs self because to avoid looping
#


func _on_Ship_player_death():
	yield(get_tree().create_timer(1), "timeout") #create a timer and wait till its done
	get_tree().change_scene("res://GameOverScreen.tscn")
