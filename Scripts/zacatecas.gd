extends Node2D

@onready var transition = $Transicion
var opc = ""
var scene
@onready var label = $NinePatchRect/VBoxContainer/Label
@onready var titulo = $NinePatchRect/VBoxContainer/Titulo

func _ready():
	transition.play("fade_in")
	$AudioStreamPlayer2D.play()
	
func _process(delta):
	if $ButtonFresnillo.is_hovered():
		label.text = "Su historia se remonta a la época colonial, ya que fue descubierta por los españoles en el siglo XVI. La mina es conocida por su rica producción de plata, plomo y zinc a lo largo de los siglos, lo que la convirtió en una de las minas más importantes de la región."
		titulo.text = "Mina El Eden"
	elif $ButtonJerez.is_hovered():
		label.text = ""
		titulo.text = ""
	elif $ButtonPlateros.is_hovered():
		label.text = ""
		titulo.text = ""
			
func _on_button_fresnillo_pressed():
	transition.play("fade_out")
	scene = preload("res://Escenas/Mina_el_Eden_Entrada.tscn");
	opc = "ZAC";

func _on_button_jerez_pressed():
	transition.play("fade_out")
	opc = "JEREZ"
	scene = preload("res://Escenas/game.tscn");

func _on_button_plateros_pressed():
	transition.play("fade_out")
	opc = "PLAT";
	scene = preload("res://Iglesia.tscn");

func _on_button_volver_pressed():
	transition.play("fade_out")
	opc = "SALIR"
	scene = preload("res://Escenas/world.tscn");

func _on_transicion_animation_finished(anim_name):
	if opc == "JEREZ":
		get_tree().change_scene_to_packed(scene)
	elif opc == "PLAT":
		get_tree().change_scene_to_packed(scene)
	elif opc == "ZAC":
		get_tree().change_scene_to_packed(scene) # Escena del museo
	elif opc == "SALIR":
		get_tree().change_scene_to_file("res://Escenas/world.tscn")
