extends CanvasLayer

signal gameover

func show_gameover():
	$TextureButton.show()

func _on_texture_button_pressed():
	emit_signal("gameover")
	$TextureButton.hide()
	get_tree().reload_current_scene()
	Global.score = 0
