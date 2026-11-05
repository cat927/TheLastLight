extends CharacterBody2D

@export var ATTACK_CD: float = 1.0
@export var ATTACK_TIME: float = 0.2
@export var ATTACK_DMG: int = 1
@export var TARGET: String = "Player"
@export var SPEED: float = 25.0
@export var MAX_SPEED: float = 100.0

var attack_timer = 0.0
var target_inside = false

func _process(delta):
	if target_inside and attack_timer <= 0: # Attack
		attack_timer = ATTACK_TIME + ATTACK_CD # Start attack
	elif attack_timer > ATTACK_CD: # Attack animation
		attack_timer -= delta
		if attack_timer <= ATTACK_CD and target_inside: # Finished animation, check if player can still be attacked
			global.health -= ATTACK_DMG
	else:
		attack_timer -= delta
		var target = get_tree().current_scene.find_child(TARGET, true, false)
		if target:
			#look_at(target.global_position)
			if velocity.length() < MAX_SPEED and not target_inside: # Not moving at top speed? AND not close to the player?
				var targetSpeed = velocity.length() + SPEED # Velocity after accelerating
				if targetSpeed > MAX_SPEED and targetSpeed < MAX_SPEED + SPEED: # Moving past top speed, but still within a value collected from walking?
					targetSpeed = MAX_SPEED - velocity.length() # Add only velocity needed to get to exactly top speed
				else:
					targetSpeed = SPEED # Accelerate as fast as possible
				velocity += (target.global_position - global_position).normalized() * targetSpeed # Accelerate based on speed calculated and direction to target
		#rotation_degrees = 0.0
	var speed = velocity.length()
	if speed > 0:
		speed = move_toward(speed, 0, SPEED / 2)
		velocity = velocity.normalized() * speed
	move_and_slide()

func _on_area_2d_body_entered(body):
	if body.name == TARGET:
			target_inside = true


func _on_area_2d_body_exited(body):
	if body.name == "Player":
			target_inside = false
