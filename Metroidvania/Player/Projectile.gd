extends Node2D

const ExplosionEffect = preload("res://Effects/ExplosionEffect.tscn")

var velocity = Vector2.ZERO

func _process(delta):
	position += velocity * delta


# warning-ignore:unused_argument
func _on_VisibilityNotifier2D_viewport_exited(viewport):
	queue_free()


func _on_Hitbox_body_entered(body): #destroying it when it hits the world
	Utils.instance_scene_on_main(ExplosionEffect,global_position)
	queue_free()


func _on_Hitbox_area_entered(area): #destroying it when it hits a enemy
	Utils.instance_scene_on_main(ExplosionEffect,global_position)
	queue_free()
