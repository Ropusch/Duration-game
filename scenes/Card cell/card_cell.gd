extends Area2D

var cell_occupied := false
var card: CardUI = null


func _on_child_entered_tree(node: Node) -> void:
	if node.is_in_group("card_ui"):
		card = node
		cell_occupied = true
		collision_layer = 0


func _on_child_exiting_tree(node: Node) -> void:
	if node.is_in_group("card_ui"):
		card = null
		cell_occupied = false
		collision_layer = 1
