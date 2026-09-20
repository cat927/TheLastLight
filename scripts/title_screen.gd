extends Node2D

@export var camera: Camera2D
@export var padding: float = 50.0
@export var speed: float = 300.0  # Pixels per second

# Drag your TextureButton here in the Inspector, or rename "TextureButton" to match your scene tree
@onready var texture_button: TextureButton = $TextureButton

var target_position: Vector2 = Vector2.ZERO

func _ready() -> void:
	# Choose the first target immediately
	target_position = get_random_position_in_camera()

func _process(delta: float) -> void:
	if not texture_button:
		return
		
	# Move global_position toward target_position at a constant speed frame-by-frame
	texture_button.global_position = texture_button.global_position.move_toward(target_position, speed * delta)
	
	# If the button gets close enough to the target, pick a new random target
	if texture_button.global_position.distance_to(target_position) < 3.0:
		target_position = get_random_position_in_camera()

func get_random_position_in_camera() -> Vector2:
	if not camera:
		camera = get_viewport().get_camera_2d()
	if not camera:
		return Vector2.ZERO 
		
	var scaled_size = get_viewport_rect().size / camera.zoom
	var top_left = camera.global_position - (scaled_size / 2.0)
	
	var min_x = top_left.x + padding
	var max_x = top_left.x + scaled_size.x - padding
	var min_y = top_left.y + padding
	var max_y = top_left.y + scaled_size.y - padding
	
	return Vector2(randf_range(min_x, max_x), randf_range(min_y, max_y))
