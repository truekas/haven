extends CharacterBody2D

const SPEED = 900.0
const JUMP_VELOCITY = -900.0
@onready var sprite: Sprite2D = $Sprite2D
	
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if Input.is_action_just_pressed("shoot"):
		var mouse = get_global_mouse_position();
		var shoot_direction = (global_position - mouse).normalized();
		velocity += shoot_direction * 2000
	if not is_on_floor():
		velocity += get_gravity() * delta
	if is_on_floor():
		velocity.x = move_toward(velocity.x, 0, 1000 * delta)

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
		
	move_and_slide();

func _process(delta: float) -> void:
	var mouse_pos: Vector2 = get_global_mouse_position()
	
	if mouse_pos.x < global_position.x:
		sprite.flip_h = true  # Face left
	else:
		sprite.flip_h = false # Face right
