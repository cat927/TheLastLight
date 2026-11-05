extends TextureRect


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	visible = get_tree().paused
	position.x = 500
	position.y = 200
