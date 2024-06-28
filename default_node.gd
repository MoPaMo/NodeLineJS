extends Panel

# Declare variables for the LineEdit nodes
@onready var input_boxes = $VBoxContainer/InOutSection/Ins.get_children().filter(lambdanode: node is HBoxContainer)
@onready var output_boxes = $VBoxContainer/InOutSection/Outs.get_children().filter(lambdanode: node is HBoxContainer)

#@onready var line_edit_3 = $VBoxContainer/InOutSection/Outs/HBoxContainer3/LineEdit

func _ready():
	# Connect the text_changed signal to custom methods using Callable
	for input_box in input_boxes:
		input_box.line_edit.text_changed.connect(Callable(self, "_on_line_edit_text_changed"))

# Define the custom methods to handle the signal
func _on_line_edit_text_changed(new_text: String) -> void:
	print("Text in LineEdit 1 changed to: ", new_text)
	_update_line_edit_3()

func _update_line_edit_3() -> void:
	var combined_text = "LineEdit1: %s, LineEdit2: %s" % [line_edit_1.text, line_edit_2.text]
	line_edit_3.text = combined_text
