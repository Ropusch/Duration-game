class_name Card
extends Resource

enum Type {REGULAR, INSTANT}
enum Effect {NULL, ATTACK, BLOCK}
enum Target {CELL, CARD}

@export_category("Card Atributes")
@export var id: String
@export var name: String
@export var type: Type
@export var target: Target

@export_category("Card Stats")
@export var duration: int
@export var effect_1: Effect
@export var effect_2: Effect
@export var effect_3: Effect
#???

var current_dur : int


func reduce_dur(value: int):
	if type == Type.INSTANT:
		return
	if current_dur <= 0:
		return
	
	current_dur -= value
	
	if current_dur <= 0:
		destroy()


func destroy():
	print(name, " destroyed")
