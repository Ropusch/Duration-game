extends CardState

const DRAG_MINIMUM_TRESHOLD := 0.05

var minimum_drag_time_elapsed := false


func enter() -> void:
	var ui_layer := get_tree().get_first_node_in_group("ui_layer")
	if ui_layer:
		card_ui.reparent(ui_layer)
	
	
	card_ui.color.color = Color.BLACK
	card_ui.state.text = "DRAGGING"
	
	
	minimum_drag_time_elapsed = false
	var treshold_timer := get_tree().create_timer(DRAG_MINIMUM_TRESHOLD, false)
	treshold_timer.timeout.connect(func(): minimum_drag_time_elapsed = true)


func on_input(event: InputEvent) -> void:
	var mouse_motion := event is InputEventMouseMotion
	var cancel = event.is_action_pressed("RMB")
	var confirm = event.is_action_pressed("LMB") or event.is_action_released("LMB")
	
	if mouse_motion:
		card_ui.global_position = card_ui.get_global_mouse_position() - card_ui.pivot_offset
	
	if cancel:
		transition_requested.emit(self, CardState.State.IDLE)
	elif minimum_drag_time_elapsed and confirm:
		get_viewport().set_input_as_handled()
		transition_requested.emit(self, CardState.State.RELEASED)
