extends Control

var nodes = []
var connections = []

func _ready():
	var parser = preload("res://scripts/parser.gd").new()
	var config = parser.load_config()

	if config:
		for node_data in config["nodes"]:
			create_node(node_data["name"], node_data["position"])

		for connection_data in config["connections"]:
			create_connection(nodes[connection_data["start_node"]], nodes[connection_data["end_node"]])


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

func save():
	var parser = preload("res://scripts/parser.gd").new()
	parser.save_config(nodes, connections)

func export():
	var exporter = preload("res://scripts/export.gd").new()
	exporter.export_to_js(nodes, connections)
