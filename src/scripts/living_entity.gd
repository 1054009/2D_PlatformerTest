class_name LivingEntity
extends CharacterBody2D

signal damage_taken(old_health, new_health)
signal killed

@export var MAX_HEALTH = 100
var health = 0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func take_damage(amount):
	var old_health = health
	
	health -= amount
	damage_taken.emit(old_health, health)
	
	if health <= 0:
		killed.emit()

func on_killed():
	queue_free()
	
func _ready():
	self.killed.connect(on_killed)

func run_physics(_delta):
	pass

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
		
	run_physics(delta)

	move_and_slide()
