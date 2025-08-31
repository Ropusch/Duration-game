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

var current_dur : int:
	set(new_value):
		current_dur = clampi(new_value, 0, 9)
