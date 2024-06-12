extends living_entity

@export var WALK_SPEED = 300.0
@export var RUN_SPEED = 550.0
@export var JUMP_POWER = -400.0

@export var MOVE_DELTA_GROUND = 20
@export var MOVE_DELTA_AIR = 6

func run_physics(_delta):
	var on_floor = is_on_floor()
	
	if Input.is_action_just_pressed("MOVE_JUMP") and on_floor:
		velocity.y = JUMP_POWER

	var direction = Input.get_axis("MOVE_LEFT", "MOVE_RIGHT")
	
	var move_speed = RUN_SPEED if Input.is_action_pressed("MOVE_FAST") else WALK_SPEED
	var move_delta = MOVE_DELTA_GROUND if on_floor else MOVE_DELTA_AIR
	
	if direction:
		velocity.x = move_toward(velocity.x, direction * move_speed, move_delta)
	else:
		velocity.x = move_toward(velocity.x, 0, move_delta)
