extends HBoxContainer
signal input_changed(new_text: String)
var line_edit: LineEdit
@export var fieldName: String = "Input"
@export var data_type: String ="Any"
var connectedTo ="None"
# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text=fieldName
	# Find the LineEdit node
	line_edit = $LineEdit
	# Connect LineEdit's text_changed signal to custom method
	line_edit.text_changed.connect(Callable(self, "_on_line_edit_text_changed"))
	$Button.button_pressed.connect(Callable(self, "_button_pressed"))
func _on_line_edit_text_changed(new_text: String):
	emit_signal("input_changed", new_text)


# Method to set initial text in the LineEdit
func set_text(initial_text: String):
	line_edit.text = initial_text

func _button_press()->void:
	if connectedTo!="None":
		connectedTo = "None"
	else:
		pass
	

# Method to get current text in the LineEdit
func get_text() -> String:
	return line_edit.text

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
