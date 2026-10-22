extends AnimatedSprite2D

var healthID: int

func _ready():
	self.position = Vector2(25 + (healthID*40), 20)


func _process(delta):
	self.frame = round(clamp((global.health / 3.0) - (healthID), 0, 1) * 3)
