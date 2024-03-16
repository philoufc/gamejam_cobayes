extends Sprite2D

@export_enum("fleur_rouge_01", "fleur_rouge_02", "sunflower", "herbes", "sunflower_pack") var fleurs
@onready var fleur_rouge_01 = $Fleur_Rouge_01
@onready var fleur_rouge_02 = $Fleur_Rouge_02
@onready var sunflower = $Sunflower
@onready var herbes = $Herbes
@onready var sunflower_pack = $Sunflower_Pack

func _ready():
	fleurs_choix(fleurs)

func fleurs_choix (type:int):
	hide_all()
	match type:
		0: 
			fleur_rouge_01.show()
		1:
			fleur_rouge_02.show()
		2:
			sunflower.show()
		3:
			herbes.show()
		4:
			sunflower_pack.show()
			

func hide_all():
	for deco in get_children():
		deco.hide()
