extends Panel

# Declare variables for the LineEdit nodes
@onready var input_boxes = get_input_boxes()
@onready var output_boxes = get_output_boxes()
@export var nodeName: String = "Default Node"

func _ready():
	$VBoxContainer/Label.text=nodeName
	# Connect the text_changed signal to a custom method using Callable for all input LineEdit nodes
	for input_box in input_boxes:
		input_box.input_changed.connect(Callable(self, "_on_line_edit_text_changed"))

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
			combined_text += input_box.get_text() + " "
		
		# Update the output LineEdit
		for outputField in output_boxes:
			outputField.set_text(combined_text.strip_edges())
