extends Node

#Global varibles are accessed by Global.var_name
var maxHealth: int = 12
var health: int = 12
var mana: int = 20

#Set up the path dictionarys
var grasslands_spawns = {
	"moth": preload("res://entities/Moth/moth.tscn")
}

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS



func _process(delta):
	if Input.is_action_just_pressed("space"):
		health -=1
		if health < 0:
			health = 12

func spawn_enemy(enemy_name: String, x: int, y: int, type: String = "base", spawn_path: String = ""):
	var scene = grasslands_spawns[enemy_name]
	var entity = scene.instantiate()
	entity.position = Vector2(x, y)
	entity.type = type
	get_tree().current_scene.get_node("entities").add_child(entity)
	
	
