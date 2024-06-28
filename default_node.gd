extends Panel

# Declare variables for the LineEdit nodes
@onready var input_boxes = get_input_boxes()
@onready var output_boxes = get_output_boxes()

func _ready():
	# Connect the text_changed signal to a custom method using Callable for all input LineEdit nodes
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

# Define the custom method to handle the signal
func _on_line_edit_text_changed(new_text: String) -> void:
	print("Text in LineEdit changed to: ", new_text)
	_recalculate()

# Function to recalculate the output
func _recalculate() -> void:
	# Assuming there's only one output LineEdit for simplicity
	if output_boxes.size() > 0:
		var combined_text = ""
		
		# Combine the texts of all input LineEdit nodes
		for input_box in input_boxes:
			var line_edit_input = input_box.get_node("LineEdit")
			combined_text += line_edit_input.text + " "
		
		# Update the output LineEdit
		for line_edit_output in output_boxes:
			line_edit_output.get_node("LineEdit").text = combined_text.strip_edges()
