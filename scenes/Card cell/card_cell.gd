class_name CardCell
extends Area2D

var cell_occupied := false
var card_ui: CardUI = null


func _on_child_entered_tree(node: Node) -> void:
	if node.is_in_group("card_ui"):
		card_ui = node
		cell_occupied = true
		collision_layer = 0


func _on_child_exiting_tree(node: Node) -> void:
	if node.is_in_group("card_ui"):
		card_ui = null
		cell_occupied = false
		collision_layer = 1



func on_turn_ends() -> void:
	if not card_ui:
		return
	
	await card_ui.card_end_turn_actions()
	
	card_ui.card.current_dur -= 1
	card_ui.update_ui()
