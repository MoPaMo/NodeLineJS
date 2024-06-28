extends Panel

# Declare variables for the LineEdit nodes
@onready var line_edit_1 = $VBoxContainer/HBoxContainer/LineEdit
@onready var line_edit_2 = $VBoxContainer/HBoxContainer2/LineEdit

func _ready():
	# Connect the text_changed signal to custom methods
	line_edit_1.connect("text_changed", self, "_on_line_edit_1_text_changed")
	line_edit_2.connect("text_changed", self, "_on_line_edit_2_text_changed")

# Define the custom methods to handle the signal
func _on_line_edit_1_text_changed(new_text: String) -> void:
	print("Text in LineEdit 1 changed to: ", new_text)

func _on_line_edit_2_text_changed(new_text: String) -> void:
	print("Text in LineEdit 2 changed to: ", new_text)
