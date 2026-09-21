extends TextureButton

# Margin to keep the button away from the edges of the camera view
@export var screen_margin: float = 20.0

var clicked:bool = false

func _ready() -> void:
	# This connects the mouse hover event to our function below
	mouse_entered.connect(_on_mouse_entered)

func _on_mouse_entered() -> void:
	teleport_to_camera_view()

func teleport_to_camera_view() -> void:
	# 1. Get the viewport bounds (screen coordinates)
	var screen_rect = get_viewport_rect()
	var screen_top_left = screen_rect.position
	var screen_bottom_right = screen_rect.end
	
	# 2. Get the matrix needed to convert screen pixels to world coordinates
	var camera_transform = get_canvas_transform().affine_inverse()
	
	# 3. Multiply (*) the transform matrix by the vectors to get world boundaries
	var min_bound = camera_transform * screen_top_left
	var max_bound = camera_transform * screen_bottom_right
	
	# 4. Account for the size of the button itself so it stays fully visible
	var max_x = max_bound.x - size.x - screen_margin
	var max_y = max_bound.y - size.y - screen_margin
	
	# 5. Pick random world coordinates within the camera's safe boundaries
	var random_x = randf_range(min_bound.x + screen_margin, max(min_bound.x + screen_margin, max_x))
	var random_y = randf_range(min_bound.y + screen_margin, max(min_bound.y + screen_margin, max_y))
	
	# 6. Teleport the button using its global world position
	global_position = Vector2(random_x, random_y)

func _input(event: InputEvent) -> void:
	# 1. Check if it's a mouse button click
	if event is InputEventMouseButton:
		# 2. Check if it's a LEFT click and it was just PRESSED down
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			# 3. Check if the global mouse position is inside the moving button
			if get_global_rect().has_point(event.global_position):
				clicked = true
				print("CLICKED A MOVING TARGET!")
				
