extends Node

var innocence_value = 7
var elapsed_time = 0
var arguments = {}

enum ArgumentType {
	LUST,
	GLUTTONY,
	GREED,
	SLOTH,
	WRATH,
	ENVY,
	PRIDE,
	NO
}

var colors :Dictionary = {
	0: Color("#71366F"),
	1: Color("#eb9661"),
	2: Color("#fdd179"),
	3: Color("#bbc3d0"), 
	4: Color("#C3482D"),
	5: Color("#44702d"), 
	6: Color("#405273"), 
	7: Color("#e9a5e2")
}

func _ready():
	print(ArgumentType)
	
	for argument_type in ArgumentType:
		arguments[argument_type] = 0

func _process(delta):
	update_elapsed_time(delta)


func collect_argument(argument_type):
	match argument_type:
		0:
			arguments["LUST"] += 1
		1:
			arguments["GLUTTONY"] += 1
		2:
			arguments["GREED"] += 1
		3:
			arguments["SLOTH"] += 1
		4:
			arguments["WRATH"] += 1
		5:
			arguments["ENVY"] += 1
		6:
			arguments["PRIDE"] += 1
		7:
			arguments["NO"] += 1

func has_enough_arguments(argument_type, required_amount) -> bool:
	if arguments.has(argument_type):
		return arguments[argument_type] >= required_amount
	else:
		return false

func consume_arguments(argument_type, amount_to_consume):
	if arguments.has(argument_type):
		arguments[argument_type] -= amount_to_consume

func adjust_innocence(amount):
	innocence_value += amount

func get_innocence() -> int:
	return innocence_value

func update_elapsed_time(delta):
	elapsed_time += delta

func get_age():
	return int(elapsed_time / 6)

func display_player_stats():
	print(arguments)
	print(get_age())
	print("elapsed time: ", elapsed_time)
	print(Time.get_ticks_msec())
	print("\n\n\n")

func update_ui_stats():
	pass
	#TODO: quand l'ui va être prêt
