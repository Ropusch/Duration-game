extends CardState


func enter() -> void:
	card_ui.color.color = Color.MEDIUM_VIOLET_RED
	card_ui.state.text = "R_CLICKED"
	
	#card_ui.hover_background.hide()
	#card_ui.name_label.hide()
	
	call_deferred("_right_clicked")


func _right_clicked():
	print("right clicked")
	#do things
	
	card_ui.global_position += Vector2(100, 0)
	
	transition_requested.emit(self, CardState.State.IDLE)
