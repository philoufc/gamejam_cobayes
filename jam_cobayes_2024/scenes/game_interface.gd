extends Control

@onready var arguments_label :Dictionary = {
	0: $Inventory/Panel/MarginContainer/HBoxContainer/LustLabel,
	1: $Inventory/Panel/MarginContainer/HBoxContainer/GluttonyLabel,
	2: $Inventory/Panel/MarginContainer/HBoxContainer/GreedLabel,
	3: $Inventory/Panel/MarginContainer/HBoxContainer/SlothLabel,
	4: $Inventory/Panel/MarginContainer/HBoxContainer/WrathLabel,
	5: $Inventory/Panel/MarginContainer/HBoxContainer/EnvyLabel,
	6: $Inventory/Panel/MarginContainer/HBoxContainer/PrideLabel,
	7: $Inventory/Panel/MarginContainer/HBoxContainer/NoLabel,
}
@onready var age_label = $PanelContainer/TopBar/HBoxContainer/AgeLabel
@onready var progress_bar = $PanelContainer/TopBar/HBoxContainer/MarginContainer/ProgressBar
@onready var innocence_label = $PanelContainer/TopBar/HBoxContainer/MarginContainer/ProgressBar/InnocenceLabel


# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager._on_interface_change.connect(_on_interface_change)
	
	for argument_type in GameManager.ArgumentType.keys():
		if GameManager.arguments.has(argument_type):
			arguments_label[GameManager.ArgumentType.get(argument_type)].text = str(GameManager.arguments[argument_type])
	
	# Update age label
	age_label.text = GameManager.get_age()
	
	# Update progress bar
	progress_bar.value = GameManager.innocence_value


func _on_interface_change():
	for argument_type in GameManager.ArgumentType.keys():
		if GameManager.arguments.has(argument_type):
			arguments_label[GameManager.ArgumentType.get(argument_type)].text = str(GameManager.arguments[argument_type])
	
	# Update age label
	age_label.text = GameManager.get_age()
	
	# Update progress bar
	progress_bar.value = GameManager.innocence_value
	innocence_label.text = "%s / 7" % GameManager.innocence_value
