extends Panel

# Declare variables for the LineEdit nodes
@onready var line_edit_1 = $VBoxContainer/HBoxContainer/LineEdit
@onready var line_edit_2 = $VBoxContainer/HBoxContainer2/LineEdit
@onready var line_edit_3 = $VBoxContainer/HBoxContainer3/LineEdit

func _ready():
	# Connect the text_changed signal to custom methods using Callable
	line_edit_1.text_changed.connect(Callable(self, "_on_line_edit_1_text_changed"))
	line_edit_2.text_changed.connect(Callable(self, "_on_line_edit_2_text_changed"))

# Define the custom methods to handle the signal
func _on_line_edit_1_text_changed(new_text: String) -> void:
	print("Text in LineEdit 1 changed to: ", new_text)
	_update_line_edit_3()

func _on_line_edit_2_text_changed(new_text: String) -> void:
	print("Text in LineEdit 2 changed to: ", new_text)
	_update_line_edit_3()

# Update LineEdit3 based on the values of LineEdit1 and LineEdit2
func _update_line_edit_3() -> void:
	var combined_text = "LineEdit1: %s, LineEdit2: %s" % [line_edit_1.text, line_edit_2.text]
	line_edit_3.text = combined_text
