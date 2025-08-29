extends CardState

var played: bool


func enter() -> void:
	card_ui.color.color = Color.FIREBRICK
	card_ui.state.text = "RELEASED"
	
	card_ui.hover_background.hide()
	card_ui.name_label.hide()
	
	played = false
	
	if not card_ui.targets.is_empty():
		played = true
		play_card()


func on_input(_event: InputEvent) -> void:
	if played:
		return
	
	transition_requested.emit(self, CardState.State.IDLE)


func play_card():
	var target: Node
	var card_pos = card_ui.get_card_center_position()
	var min_distance = card_pos.distance_to(card_ui.targets[0].global_position)
	for node in card_ui.targets:
		if card_pos.distance_to(node.global_position) <= min_distance:
			min_distance = card_pos.distance_to(node.global_position)
			target = node
	card_ui.play_card_for(target)
