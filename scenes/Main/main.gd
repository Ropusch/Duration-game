extends Node2D

@onready var card_cells_handler: CardCellsHandler = $CardCellsHandler
@onready var end_turn_button: Button = $UI/EndTurnButton


func _ready() -> void:
	pass # Replace with function body.


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed and event.keycode == KEY_ESCAPE:
		pause_menu()


func pause_menu():
	#TODO
	get_tree().quit()


func start_new_turn() -> void:
	end_turn_button.disabled = false


func _on_end_turn_button_pressed() -> void:
	end_turn_button.disabled = true
	await card_cells_handler.on_turn_ends()
	
	start_new_turn()
