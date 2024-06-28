extends HBoxContainer
signal input_changed(new_text: String)
var line_edit: LineEdit

# Called when the node enters the scene tree for the first time.
func _ready():
	# Find the LineEdit node
	line_edit = $LineEdit
	# Connect LineEdit's text_changed signal to custom method
	line_edit.text_changed.connect(Callable(self, "_on_line_edit_text_changed"))
	
func _on_line_edit_text_changed(new_text: String):
	emit_signal("input_changed", new_text)

func set_text(initial_text: String):
	line_edit.text = initial_text

# Method to get current text in the LineEdit
func get_text() -> String:
	return line_edit.text

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
