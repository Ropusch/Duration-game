class_name Card
extends Resource

enum Type {REGULAR, INSTANT}
enum EndTurnEffect {NULL, ATTACK, ATTACK_PLUS_DURATION, ATTACK_MINUS_DURATION, BLOCK}
enum PassiveEffect {CHARGED}
enum Target {CELL, CARD}

@export_category("Card Atributes")
@export var id: String
@export var name: String
@export var type: Type
@export var target: Target

@export_category("Card Stats")
@export var duration: int
@export var end_turn_effects: Dictionary[EndTurnEffect, int]
@export var passive_effects: Dictionary[PassiveEffect, int]
#???

var current_dur : int:
	set(new_value):
		current_dur = clampi(new_value, 0, 9)


func do_end_turn_effects() -> void:
	for effect in end_turn_effects.keys():
		match effect:
			EndTurnEffect.ATTACK:
				attack(end_turn_effects[effect])
			EndTurnEffect.ATTACK_PLUS_DURATION:
				attack(current_dur + end_turn_effects[effect])
			EndTurnEffect.ATTACK_MINUS_DURATION:
				attack(- current_dur + end_turn_effects[effect])


func attack(value):
	print("attack for ", value)
