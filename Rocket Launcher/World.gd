extends Node

onready var animationPlayer = $AnimationPlayer #acessing child

func _on_LaunchButton_pressed(): #acessing a parent with signals
	animationPlayer.play("Launch")
