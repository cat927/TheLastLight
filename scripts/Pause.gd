extends Node

@onready var paused: Array = []
var current_scene_name: String = ""
var run: bool = false

func _enter_tree() -> void:
	get_tree().scene_changed.connect(_on_scene_changed)
func _on_scene_changed() -> void:
	var current_scene = get_tree().current_scene
	if current_scene == null:
		return
		
	current_scene_name = current_scene.scene_file_path.get_file()

	if current_scene_name == "game.tscn":
		run = true
		
func _process(delta: float):
	if current_scene_name != "game.tscn":
		run = false
	else:
		run = true
	if run == true:
		for node in paused:
			if node != null and is_instance_valid(node):
				if node.process_mode == Node.PROCESS_MODE_INHERIT:
					node.process_mode = Node.PROCESS_MODE_DISABLED
func remove_item_from_paused(item):
	# Fixed loop: counts backward to prevent index-shifting out-of-bounds crashes
	for x in range(paused.size() - 1, -1, -1):
		if paused[x] == item:
			if is_instance_valid(paused[x]):
				paused[x].process_mode = Node.PROCESS_MODE_INHERIT
			paused.remove_at(x)
