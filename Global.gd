extends Node

var score = 0;

var coleccionables = 0 :
	set(val):
		coleccionables=val
		if player != null:
			print("Tomó")
			#$AudioStreamPlayer2D.play()
	get:
		return coleccionables

var player
