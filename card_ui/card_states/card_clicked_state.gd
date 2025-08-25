extends CardState


func enter() -> void:
	card_ui.color.color = Color.DARK_RED
	card_ui.state.text = "CLICKED"
	
	#card_ui.hover_background.hide()
	#card_ui.name_label.hide()


func on_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		transition_requested.emit(self, CardState.State.DRAGGING)
