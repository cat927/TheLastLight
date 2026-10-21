extends AnimatedSprite2D

var healthID: int

func _ready():
	self.position = Vector2(100, 100) #Vector2(25 + (healthID*40), 20)


func _process(delta):
	self.frame = 3 #round(clamp((global.health / 3) - (healthID - 1), 0, 1) * 3)
