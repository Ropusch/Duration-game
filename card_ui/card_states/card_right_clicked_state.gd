extends CardState


func enter() -> void:
	card_ui.color.color = Color.MEDIUM_VIOLET_RED
	card_ui.state.text = "R_CLICKED"
	
	#card_ui.hover_background.hide()
	#card_ui.name_label.hide()
	
	call_deferred("_right_clicked")


func _right_clicked():
	#do things
	card_ui.card.reduce_dur(1)
	card_ui.update_ui()
	
	
	transition_requested.emit(self, CardState.State.HOVER)
