extends Node


var piedras = 0 :
	set(val):
		piedras=val
		if player != null:
			print("Tomó")
			#$AudioStreamPlayer2D.play()
	get:
		return piedras

var player
