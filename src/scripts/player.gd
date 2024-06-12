extends living_entity

@export var WALK_SPEED = 300.0
@export var RUN_SPEED = 550.0
@export var JUMP_POWER = -400.0

func run_physics(_delta):
	if Input.is_action_just_pressed("MOVE_JUMP") and is_on_floor():
		velocity.y = JUMP_POWER

	var direction = Input.get_axis("MOVE_LEFT", "MOVE_RIGHT")
	var move_speed = RUN_SPEED if Input.is_action_pressed("MOVE_FAST") else WALK_SPEED
	
	if direction:
		velocity.x = direction * move_speed
	else:
		velocity.x = move_toward(velocity.x, 0, move_speed)
