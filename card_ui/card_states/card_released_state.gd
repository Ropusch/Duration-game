extends CardState


func enter() -> void:
	card_ui.color.color = Color.FIREBRICK
	card_ui.state.text = "RELEASED"
	
	card_ui.hover_background.hide()
	card_ui.name_label.hide()
