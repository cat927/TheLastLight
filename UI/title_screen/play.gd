extends TextureButton

func _on_button_up():
	get_tree().change_scene_to_file("res://other/scenes/game.tscn")
	
func _on_exit_button_up():
	get_tree().quit()
