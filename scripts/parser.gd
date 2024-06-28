extends Node

func save_config(nodes, connections):
	var config = {
		"nodes": [],
		"connections": []
	}

	for node in nodes:
		config["nodes"].append({
			"name": node.get_node("Label").text,
			"position": node.position
		})

	for connection in connections:
		config["connections"].append({
			"start_node": nodes.find(connection.start_node),
			"end_node": nodes.find(connection.end_node)
		})

	var file = File.new()
	file.open("res://resources/config.json", File.WRITE)
	file.store_string(to_json(config))
	file.close()

func load_config():
	var file = File.new()
	if not file.file_exists("res://resources/config.json"):
		return
	file.open("res://resources/config.json", File.READ)
	var config = parse_json(file.get_as_text())
	file.close()

	return config
