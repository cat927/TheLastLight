extends AnimatedSprite2D

var num: int = 0

func _ready() -> void:
	num = Global.healthNum
	Global.healthNum += 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.frame = Global.health[num-1]
