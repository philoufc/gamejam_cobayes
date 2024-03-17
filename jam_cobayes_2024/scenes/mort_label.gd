extends VBoxContainer

var titre :Dictionary = {
	0: "L'orgueil a eu raison de toi",
	1: "L'avarice a eu raison de toi",
	2: "L'envie a eu raison de toi",
	3: "La colère a eu raison de toi", 
	4: "La luxure a eu raison de toi",
	5: "La gourmandise a eu raison de toi", 
	6: "La paresse a eu raison de toi"
}

var sousTitre :Dictionary = {
	0: "Tu crois que tu as toujours raison. Lourd...",
	1: "Tu seras éternellement insatisfaite!",
	2: "La jalousie maladive t'a emportée.",
	3: "Tu es devenu bélier ascendant colérique!", 
	4: "Ta richesse a semé la solitude autour de toi.",
	5: "Tes sentiments ont finis par te manger...", 
	6: "Te voilà fossilisé dans l'inaction."
}

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	var from = 0
	var to = titre.size() - 1
	var index = rng.randi_range(from, to)
	$Age.text = str("À l'âge de ", str(GameManager.get_age()), " ans")
	$Title.text = titre[index]
	$SubTitle.text = sousTitre[index]
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
