extends "res://Enemies/Enemy.gd"

enum DIRECTION {LEFT = -1, RIGHT = 1}

export(DIRECTION) var WALKING_DIRECTION = DIRECTION.RIGHT

onready var floorCast = $FloorCast
onready var wallCast = $WallCast


func _ready():
	wallCast.cast_to.x *= WALKING_DIRECTION #updating the direction we are casting based on initial direction

func _physics_process(delta):
	if wallCast.is_colliding(): #if we find a wall
		global_position = wallCast.get_collision_point() #takes up from the wall to the floor
		var normal = wallCast.get_collision_normal()
		rotation = normal.rotated(deg2rad(90)).angle() #makes that our rotation to be like the wall
	else:
		floorCast.rotation_degrees = -MAX_SPEED *10 * WALKING_DIRECTION * delta 
		if floorCast.is_colliding():
			global_position = floorCast.get_collision_point() #make us move where we are colliding
			var normal = floorCast.get_collision_normal()
			rotation = normal.rotated(deg2rad(90)).angle() 
		else: #there is not a collision we hit a edge
			rotation_degrees += 20 * WALKING_DIRECTION
