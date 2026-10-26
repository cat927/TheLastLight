extends CharacterBody2D

const SPEED = 50.0
const MAX_SPEED = 150.0
const DASH_CD = 1.0
const DASH_SPEED = 600.0
const DASH_TIME = 0.15

var dash_timer = 0.0
var vel_slide = true

@onready var sprite = $Sprite2D

func _physics_process(delta):
	if global.health == 0:
		self.position = Vector2(0, 0)
	else:
		if Input.is_action_just_pressed("right_mouse") and dash_timer <= 0.0:
			velocity.x = Vector2(position).direction_to(get_global_mouse_position()).x * DASH_SPEED
			velocity.y = Vector2(position).direction_to(get_global_mouse_position()).y * DASH_SPEED
			dash_timer = DASH_TIME + DASH_CD
		if dash_timer > DASH_CD:
			dash_timer -= delta
			vel_slide = false
		else:
			vel_slide = true
			if dash_timer > 0.0:
				dash_timer = clamp(dash_timer - delta, 0.0, 9999.0)
			var hori = Input.get_axis("left", "right")
			var vert = Input.get_axis("up", "down")
			var diag = 1.0
			if vert and hori:
					diag = sin(deg_to_rad(45))
			if hori and abs(velocity.x) <= MAX_SPEED:
				if round(hori) != 0:
					sprite.flip_h = (((round(hori) + 1) / 2) - 1) * -1
				velocity.x += hori * SPEED * diag
			else:
				pass
				#velocity.x = move_toward(velocity.x, 0, SPEED / 2)
			if vert and abs(velocity.y) <= MAX_SPEED:
				velocity.y += vert * SPEED * diag
			else:
				pass
				#velocity.y = move_toward(velocity.y, 0, SPEED / 2)
	if vel_slide:
		var speed = velocity.length()
		if speed > 0:
			speed = move_toward(speed, 0, SPEED / 2)
			velocity = velocity.normalized() * speed
	move_and_slide()
