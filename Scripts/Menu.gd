extends CanvasLayer

signal gameover

func show_gameover():
	$TextureButton.show()
	$TextureButton2.show()

func _on_texture_button_pressed():
	emit_signal("gameover")
	$TextureButton.hide()
	get_tree().reload_current_scene()
	Global.score = 0


func _on_texture_button_2_pressed():
	get_tree().change_scene_to_file("res://Escenas/zacatecas.tscn")
