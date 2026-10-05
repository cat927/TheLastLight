extends Camera2D

@onready var player = $"../Player"

func _process(delta):
	position.x = lerp(position.x, player.position.x, 0.25)
	position.y = lerp(position.y, player.position.y, 0.25)
