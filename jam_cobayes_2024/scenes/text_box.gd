extends MarginContainer

@onready var label = $MarginContainer/Label
@onready var timer = $LetterDisplayTimer

const MAX_WIDTH = 256

var text = ""
var letter_index = 0
var finished_displaying = false

var letter_time = 0.03
var space_time = 0.06
var hang_time = 4

func _hide_textbox():
	var tween = create_tween()
	tween.tween_property(self, "position", position + Vector2(0, 40), 0.5).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_IN)	
	tween.parallel().tween_property(self, "scale", Vector2(0, 0), 0.5).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_IN)
	tween.tween_callback(self.queue_free)

func display_text(text_to_display: String):
	set_pivot_offset(size / 2)
	scale = Vector2(0,0)
	
	text = text_to_display
	label.text = text_to_display
	
	await resized
	custom_minimum_size.x = min(size.x, MAX_WIDTH)
	
	if size.x > MAX_WIDTH:
		label.autowrap_mode = TextServer.AUTOWRAP_WORD
		await resized # wait for x resize
		await resized # wait for y resize
		custom_minimum_size.y = size.y
	
	global_position.x -= size.x / 2
	
	var tween = create_tween()
	tween.tween_property(self, "position", position + Vector2(0, -60), 0.5).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	tween.parallel().tween_property(self, "scale", Vector2(1, 1), 0.5).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	
	label.text = ""
	_display_letter()

func _display_letter():
	label.text += text[letter_index]
	
	letter_index += 1
	if letter_index >= text.length():
		finished_displaying = true
		timer.start(hang_time)
		return
	
	match text[letter_index]:
		" ":
			timer.start(space_time)
		_:
			timer.start(letter_time)

func _on_letter_display_timer_timeout():
	if finished_displaying:
		_hide_textbox()
		return
	_display_letter()
