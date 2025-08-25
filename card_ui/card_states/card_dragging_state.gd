extends CardState


func enter() -> void:
	card_ui.color.color = Color.BLACK
	card_ui.state.text = "DRAGGING"
	
	#reparenting? 28:00 2/8


func on_input(event: InputEvent) -> void:
	var mouse_motion := event is InputEventMouseMotion
	var cancel = event.is_action_pressed("RMB")
	var confirm = event.is_action_pressed("LMB") or event.is_action_released("LMB")
	
	if mouse_motion:
		card_ui.global_position = card_ui.get_global_mouse_position() - card_ui.pivot_offset
	
	if cancel:
		transition_requested.emit(self, CardState.State.IDLE)
	elif confirm:
		get_viewport().set_input_as_handled()
		transition_requested.emit(self, CardState.State.RELEASED)
