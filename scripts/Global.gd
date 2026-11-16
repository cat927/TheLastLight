extends Node

#Global varibles are accessed by Global.var_name
var maxHealth: int = 12
var health: int = 12
var mana: int = 20
var is_console_open := false
#Set up the path dictionarys
var grasslands_spawns = {
	"moth": preload("res://entities/Moth/moth.tscn")
}

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS
	Console.add_command('summon', spawn_enemy, 5)
	Console.pause_enabled = true
	Console.console_opened.connect(_on_console_opened)
	Console.console_closed.connect(_on_console_closed)

func _on_console_opened() -> void:
	is_console_open = true

func _on_console_closed() -> void:
	is_console_open = false

func show_entity_hitboxs():
	pass
func show_attack_rangeboxes():
	pass

func _process(delta):
	if Input.is_action_just_pressed("space"):
		health -=1
		if health < 0:
			health = 12

func spawn_enemy(enemy_name: String, x, y, type: String = "base", spawn_path: String = ""):
	x = int(x)
	y = int(y)
	var scene = grasslands_spawns[enemy_name]
	var entity = scene.instantiate()
	entity.position = Vector2(x, y)
	entity.type = type
	get_tree().current_scene.get_node("entities").add_child(entity)
	
	
