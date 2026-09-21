extends Control
@onready var tex = $TextureButton
# Track the number of clicks
var click_count: int = 0

# Reference the Label node using its unique path in your scene
@onready var display_label: Label = $Label

func _ready() -> void:
	# Set the initial text when the game starts
	update_display()


# Helper function to easily format your label text
func update_display() -> void:
	if tex.clicked == false:
		display_label.text = "You have failed " + str(click_count) + " times!"
	else:
		display_label.text = "YAY! You clicked the button!"

func _on_texture_button_mouse_entered() -> void:
	click_count += 1
	update_display()
