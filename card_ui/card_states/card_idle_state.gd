extends CardState



func enter() -> void:
	if not card_ui.is_node_ready():
		await card_ui.ready  #godot najpierw ładuje dzieci
	
	card_ui.reparent_requested.emit(card_ui)
	
	card_ui.color.color = Color.DARK_GREEN
	card_ui.state.text = "IDLE"
	card_ui.pivot_offset = Vector2.ZERO
	
	card_ui.hover_background.hide()
	card_ui.name_label.hide()
	
	card_ui.z_index = 0

func on_mouse_entered():
	transition_requested.emit(self, CardState.State.HOVER)
