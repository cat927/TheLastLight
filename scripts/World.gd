extends Node2D

const Heart = preload("res://scenes/heart.tscn")
var heartList: Array = []
@onready var UI = $UI

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(4):
		var heart = Heart.instantiate()
		heart.position = Vector2(25 + (i*40), 20)
		UI.add_child(heart)
		heartList.append(heart)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
