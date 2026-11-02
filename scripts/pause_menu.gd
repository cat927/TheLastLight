extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false
	position.x = 50
	position.y = position.x


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	visible = get_tree().paused
