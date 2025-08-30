extends CardState


func enter() -> void:
	card_ui.color.color = Color.DEEP_PINK
	card_ui.state.text = "PLAYED"
	
	card_ui.hover_background.hide()
	card_ui.name_label.hide()


func on_mouse_entered():
	transition_requested.emit(self, CardState.State.HOVER)
