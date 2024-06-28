extends Panel

# Declare variables for the LineEdit nodes
@onready var input_boxes = get_input_boxes()
@onready var output_boxes = get_output_boxes()
@export var nodeName: String = "Default Node"
var dragging: bool = false
var offset = Vector2.ZERO
func _ready():
	set_process_input(true)
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

# Called every frame. 'delta' is the elapsed time since the previous frame.
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if dragging:
		global_position = get_viewport().get_mouse_position() - offset

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				if get_global_rect().has_point(event.position):
					dragging = true
					offset = event.position - global_position
			else:
				dragging = false
