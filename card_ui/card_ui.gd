class_name CardUI
extends Control


@onready var name_label: Label = $name_label
@onready var efx_label: Label = $efx_label
@onready var hover_background: ColorRect = $hover_background

@onready var state_machine: CardStateMachine = $CardStateMachine


#DEBUGGING!!!
@onready var state: Label = $State
@onready var color: ColorRect = $Color


func _ready() -> void:
	name_label.text = name
	state_machine.init(self)




func _input(event):
	state_machine.on_input(event)


func _on_gui_input(event):
	state_machine.on_gui_input(event)


func _on_mouse_entered():
	state_machine.on_mouse_entered()


func _on_mouse_exited():
	state_machine.on_mouse_exited()
