extends TextureRect


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	visible = get_tree().paused


func _on_exit_button_up():
	get_tree().quit()


func _on_resume_button_up():
	get_tree().paused = !get_tree().paused
