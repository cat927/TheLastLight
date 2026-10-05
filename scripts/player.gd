extends CharacterBody2D


const SPEED = 100.0
const MAX_SPEED = 300.0
@onready var sprite = $Sprite2D

func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var hori = Input.get_axis("left", "right")
	var vert = Input.get_axis("up", "down")
	var diag = 1.0
	if hori:
		if round(hori) != 0:
			sprite.flip_h = (((round(hori) + 1) / 2) - 1) * -1
		if vert:
			diag = sin(45)
			velocity.x += hori * SPEED * diag
		else:
			velocity.x += hori * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if vert:
		velocity.y += vert * SPEED * diag
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	velocity.x = clamp(velocity.x, -300.0 * diag, 300.0 * diag)
	velocity.y = clamp(velocity.y, -300.0 * diag, 300.0 * diag)
	move_and_slide()
