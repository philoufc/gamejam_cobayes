extends Sprite2D

@export_enum("fontaine", "roche_1", "roche_2", "pot", "statue", "panneau_1", "panneau_2", "cercle") var decorations
@onready var fontaine = $Fontaine
@onready var roche_1 = $Roche_1
@onready var roche_2 = $Roche_2
@onready var pot = $Pot
@onready var statue = $Statue
@onready var panneau_1 = $Panneau_1
@onready var panneau_2 = $Panneau_2
@onready var cercle = $Cercle

func _ready():
	decorations_choix(decorations)

func decorations_choix (type:int):
	hide_all()
	match type:
		0: 
			fontaine.show()
		1:
			roche_1.show()
		2:
			roche_2.show()
		3:
			pot.show()
		4:
			statue.show()
		5:
			panneau_1.show()
		6:
			panneau_2.show()
		7:
			cercle.show()

func hide_all():
	for deco in get_children():
		deco.hide()
