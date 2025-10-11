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
@onready var detector: Area2D = $detector

var targets: Array[Node] = []

#DEBUGGING!!!
@onready var state: Label = $State
@onready var color: ColorRect = $Color


func _ready() -> void:
	#TODO !!!!!!!!!!!!!!!!!!!11
	card = card.duplicate()
	
	
	card.current_dur = card.duration
	
	name_label.text = card.name
	dur_label.text = str(card.current_dur)
	
	if card.type == card.Type.INSTANT:
		dur_label.hide()
		detector.collision_mask = 2
	
	state_machine.init(self)


func update_ui():
	name_label.text = card.name
	dur_label.text = str(card.current_dur)
	
	if card.current_dur == 0 and card.type == card.Type.REGULAR:
		card_exhausted()


func card_exhausted() -> void:
	#TODO !!!!!!!!!!!!!!!!1
	queue_free()


func card_end_turn_actions() -> void:
	print(name, "is doing end turn actions")
	
	var default_color = color.color
	color.color = Color.TOMATO
	await get_tree().create_timer(1).timeout
	color.color = default_color


func get_card_center_position() -> Vector2:
	return $detector/CollisionShape2D.global_position


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


### PALYING CARDS

func play_card_for(target):
	if card.target == card.Target.CELL:
		reparent(target)
		position = Vector2.ZERO - $detector/CollisionShape2D.position
		detector.collision_layer = 2
	elif card.target == card.Target.CARD:
		target = target.get_parent()
		target.card.current_dur += 1
		target.update_ui()
		discard()


func discard() -> void:
	queue_free()
