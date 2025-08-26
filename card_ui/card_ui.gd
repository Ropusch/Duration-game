class_name CardUI
extends Control

@warning_ignore("unused_signal")
signal reparent_requested(wich_card_ui: CardUI)

@export var card: Card

@onready var name_label: Label = $name_label
@onready var dur_label: Label = $dur_label
@onready var efx_label: Label = $efx_label
@onready var hover_background: ColorRect = $hover_background

@onready var state_machine: CardStateMachine = $CardStateMachine

var targets: Array[Node] = []

#DEBUGGING!!!
@onready var state: Label = $State
@onready var color: ColorRect = $Color


func _ready() -> void:
	card.current_dur = card.duration
	
	name_label.text = card.name
	dur_label.text = str(card.current_dur)
	
	if card.type == card.Type.INSTANT:
		dur_label.hide()
	
	state_machine.init(self)


func update_ui():
	name_label.text = card.name
	dur_label.text = str(card.current_dur)



#INPUTS
func _input(event):
	state_machine.on_input(event)


func _on_gui_input(event):
	state_machine.on_gui_input(event)


func _on_mouse_entered():
	state_machine.on_mouse_entered()


func _on_mouse_exited():
	state_machine.on_mouse_exited()


func _on_detector_area_entered(area: Area2D) -> void:
	if not targets.has(area):
		targets.append(area)


func _on_detector_area_exited(area: Area2D) -> void:
	targets.erase(area)
