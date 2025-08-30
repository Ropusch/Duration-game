extends CardState

@onready var card_state_machine: CardStateMachine = $".."


func enter() -> void:
	card_ui.color.color = Color.DARK_SLATE_BLUE
	card_ui.state.text = "HOVER"
	card_ui.pivot_offset = Vector2.ZERO
	
	card_ui.hover_background.show()
	card_ui.name_label.show()
	
	card_ui.z_index = 2


func on_mouse_exited():
	transition_requested.emit(self, card_state_machine.last_state.state)


func on_gui_input(event: InputEvent) -> void:
	if event.is_action_pressed("LMB"):
		card_ui.pivot_offset = card_ui.get_global_mouse_position() - card_ui.global_position
		transition_requested.emit(self, CardState.State.CLICKED)
		return
	if event.is_action_pressed("RMB"):
		transition_requested.emit(self, CardState.State.R_CLICKED)
