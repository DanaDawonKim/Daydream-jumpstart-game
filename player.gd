extends CharacterBody2D
@export var spawn_point:Node2D

const SPEED = 700.0
const JUMP_VELOCITY = -1130.0

func _ready():
	global_position = spawn_point.global_position
	
func die():
	global_position = spawn_point.global_position
	velocity = Vector2.ZERO


func _physics_process(delta: float) -> void:
	# Add the gravity. 
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if velocity.x>0:
		$Sprite2D.flip_h = false
	elif velocity.x<0:
		$Sprite2D.flip_h = true
		
	if global_position.y > 1500:
		die()
		
		

		
		
	move_and_slide()


func _on_killzone_body_entered(body) -> void:
	body.die()
