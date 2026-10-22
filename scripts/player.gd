extends CharacterBody2D


const SPEED = 50.0
const MAX_SPEED = 150.0
@onready var sprite = $Sprite2D

func _physics_process(delta):
	if global.health == 0:
		self.position = Vector2(0, 0)
	var hori = Input.get_axis("left", "right")
	var vert = Input.get_axis("up", "down")
	print(str(vert) + ", " + str(hori))
	var diag = 1.0
	if vert and hori:
			diag = sin(deg_to_rad(45))
	if hori and abs(velocity.x) <= MAX_SPEED:
		if round(hori) != 0:
			sprite.flip_h = (((round(hori) + 1) / 2) - 1) * -1
		velocity.x += hori * SPEED * diag
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED / 2)
	if vert and abs(velocity.y) <= MAX_SPEED:
		velocity.y += vert * SPEED * diag
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED / 2)
	move_and_slide()
