class_name living_entity
extends CharacterBody2D

@export var MAX_HEALTH = 100
var m_iHealth = 0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func run_physics(delta):
	pass

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
		
	run_physics(delta)

	move_and_slide()
