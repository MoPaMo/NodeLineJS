extends Node2D

func set_line(start_pos: Vector2, end_pos: Vector2):
	$Line2D.points = [start_pos, end_pos]
