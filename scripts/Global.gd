extends Node

#Global varibles are accessed by Global.var_name
var maxHealth: int = 12
var health: int = 12
var mana: int = 20

func _process(delta):
	if Input.is_action_just_pressed("space"):
		health -=1
		if health < 0:
			health = 12
