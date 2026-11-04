extends ProgressBar

@onready var player = %Player

func _process(delta):
	var dash = clamp(player.dash_timer, 0.0, player.DASH_CD)
	value = 100 - ((dash / player.DASH_CD) * 100)
	
