extends Panel

# Declare variables for the LineEdit nodes
@onready var input_boxes = get_input_boxes()
@onready var output_boxes = get_output_boxes()

# Assuming you have specific LineEdit nodes you want to reference
@onready var line_edit_1 = input_boxes[0].get_node("LineEdit") if input_boxes.size() > 0 else null
@onready var line_edit_2 = input_boxes[1].get_node("LineEdit") if input_boxes.size() > 1 else null
@onready var line_edit_3 = output_boxes[0].get_node("LineEdit") if output_boxes.size() > 0 else null

func _ready():
	# Connect the text_changed signal to custom methods using Callable
	for input_box in input_boxes:
		var line_edit = input_box.get_node("LineEdit")
		line_edit.text_changed.connect(Callable(self, "_on_line_edit_text_changed"))

# Function to get input boxes
func get_input_boxes():
	var children = $VBoxContainer/InOutSection/Ins.get_children()
	var result = []
	for child in children:
		if child is HBoxContainer:
			result.append(child)
	return result

# Function to get output boxes
func get_output_boxes():
	var children = $VBoxContainer/InOutSection/Outs.get_children()
	var result = []
	for child in children:
		if child is HBoxContainer:
			result.append(child)
	return result

# Define the custom methods to handle the signal
func _on_line_edit_text_changed(new_text: String) -> void:
	print("Text in LineEdit changed to: ", new_text)
	_update_line_edit_3()

func _update_line_edit_3() -> void:
	if line_edit_1 and line_edit_2 and line_edit_3:
		var combined_text = "LineEdit1: %s, LineEdit2: %s" % [line_edit_1.text, line_edit_2.text]
		line_edit_3.text = combined_text
