class_name CardCellsHandler
extends Node2D

var cells: Array[Node] = []
var cell_width = 68.0
var cell_x_space = 6.0

func _ready() -> void:
	for child in get_children():
		cells.append(child)
	arrange_cells()


func arrange_cells() -> void:
	for i in range(len(cells)):
		cells[i].position.y = 0.0
		cells[i].position.x = -((len(cells)-1)*(cell_width+cell_x_space))/2 + (cell_width+cell_x_space)*i 



func on_turn_ends() -> void:
	
	for cell in get_children():
		if cell.is_in_group("card_cells"):
			await cell.on_turn_ends()
