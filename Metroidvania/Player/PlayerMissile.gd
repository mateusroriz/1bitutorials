extends "res://Player/Projectile.gd"

const EnemyDeathEffect = preload("res://Effects/EnemyDeathEffect.tscn")

const BRICK_LAYER_BIT = 4 

func _ready():
	SoundFx.play("Explosion")

func _on_Hitbox_body_entered(body): 
	if body.get_collision_layer_bit(BRICK_LAYER_BIT): #is the body on this collision layer return true or false
		body.queue_free() #if its a brick destroy it
		Utils.instance_scene_on_main(EnemyDeathEffect, body.global_position + Vector2(8,8)) #adding v2 8,8 to put the effect in the scenter of the sprites
	._on_Hitbox_body_entered(body) #running the logic inside projectile

