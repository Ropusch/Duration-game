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
		print("played card ", card_ui.card.name, " for: ", card_ui.targets)


func on_input(_event: InputEvent) -> void:
	if played:
		return
	
	transition_requested.emit(self, CardState.State.IDLE)
