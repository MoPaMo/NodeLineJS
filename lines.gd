extends Control

var first_button_pressed = null
var line = Line2D.new()

func _ready():
	add_child(line)
	for button in get_tree().get_nodes_in_group("Buttons"):
		button.pressed.connect(Callable(self, "_on_Button_pressed"))
#	line_edit.text_changed.connect(Callable(self, "_on_line_edit_text_changed"))
func _on_Button_pressed(button):
	if first_button_pressed == null:
		first_button_pressed = button
	else:
		line.points = [first_button_pressed.rect_position + first_button_pressed.rect_size / 2, button.rect_position + button.rect_size / 2]
		first_button_pressed = null
