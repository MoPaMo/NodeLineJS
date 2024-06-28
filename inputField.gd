extends HBoxContainer
signal input_changed(new_text: String)
var line_edit: LineEdit
@export var fieldName: String = "Input"
@export var data_type: String ="Any"
var connectedTo ="None"
# Called when the node enters the scene tree for the first time.
func _ready():
	var main_node = get_tree().get_root().get_node("Main")
	print(main_node.get_name())
	main_node.hi()
	$Label.text=fieldName
	# Find the LineEdit node
	line_edit = $LineEdit
	# Connect LineEdit's text_changed signal to custom method
	line_edit.text_changed.connect(Callable(self, "_on_line_edit_text_changed"))
	$Button.connect("pressed", _button_pressed.bind())
func _on_line_edit_text_changed(new_text: String):
	emit_signal("input_changed", new_text)

func findNodeWithGroup(node, groupName):
	if node.is_in_group(groupName):
		return node

	for child in node.get_children():
		var result = findNodeWithGroup(child, groupName)
		if result != null:
			return result

	return null
	if node.has_group(groupName):
		return node

	for child in node.get_children():
		var result = findNodeWithGroup(child, groupName)
		if result != null:
			return result

	return null
	
# Method to set initial text in the LineEdit
func set_text(initial_text: String):
	line_edit.text = initial_text

func _button_pressed()->void:
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
