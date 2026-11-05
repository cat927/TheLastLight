extends CharacterBody2D

const ATTACK_CD = 1.0
const ATTACK_TIME = 0.15
const ATTACK_DMG = 1

var attack_timer = 0.0
var target_inside = false

func _process(delta):
	if target_inside and attack_timer <= 0:
		attack_timer = ATTACK_TIME + ATTACK_CD
	elif attack_timer > ATTACK_CD:
		attack_timer -= delta
		if attack_timer <= ATTACK_CD and target_inside:
			global.health -= 1
	else:
		attack_timer -= delta

func _on_area_2d_body_entered(body):
	if body.name == "Player":
			target_inside = true


func _on_area_2d_body_exited(body):
	if body.name == "Player":
			target_inside = false
