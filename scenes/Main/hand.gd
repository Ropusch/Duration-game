class_name Hand
extends HBoxContainer

var last_child: Node
var last_child_index: int


func _ready() -> void:
	for child in get_children():
		var card_ui := child as CardUI
		card_ui.reparent_requested.connect(_on_card_ui_reparent_requested)



func _on_card_ui_reparent_requested(child: CardUI):
	child.reparent(self)
	if child == last_child:
		move_child(child, last_child_index)


func _on_child_exiting_tree(node: Node) -> void:
	last_child = node
	last_child_index = node.get_index()
