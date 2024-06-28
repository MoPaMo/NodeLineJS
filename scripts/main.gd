extends Control

var nodes = []
var connections = []

func _ready():
	pass

func create_node(name: String, position: Vector2):
	var node_scene = preload("res://scenes/node.tscn")
	var node = node_scene.instance()
	node.set_position(position)
	add_child(node)
	nodes.append(node)
	node.get_node("Label").text = name

func create_connection(start_node, end_node):
	var connection_scene = preload("res://scenes/connection.tscn")
	var connection = connection_scene.instance()
	connection.set_line(start_node.global_position, end_node.global_position)
	add_child(connection)
	connections.append(connection)
