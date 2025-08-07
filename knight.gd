extends CharacterBody2D


const SPEED = 200.0


var direction = 1

func move_enemy():
	velocity.x = SPEED*direction

func reverse_direction():
	if is_on_wall():
		direction = -direction


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if velocity.x>0:
		$Sprite2D.flip_h = true
	elif velocity.x<0:
		$Sprite2D.flip_h = false
	
	move_enemy()
	move_and_slide()
	reverse_direction()

	
