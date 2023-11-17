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
		titulo.text = "Mina El Eden, Zacatecas"
	elif $ButtonJerez.is_hovered():
		label.text = "Jerez es una ciudad en el estado de Zacatecas, México. Es conocida por su rica herencia cultural y su belleza arquitectónica, con calles adoquinadas, edificios históricos y una vibrante vida cultural."
		titulo.text = "Jerez"
	elif $ButtonPlateros.is_hovered():
		label.text = "Plateros es una localidad ubicada en el estado de Zacatecas, México. Se destaca por su fuerte tradición religiosa y es conocida por ser el hogar de un santuario importante dedicado al Niño de Atocha. Este santuario atrae a numerosos peregrinos y visitantes de toda la región y del país que vienen en busca de protección y milagros del Niño de Atocha, un santo católico muy venerado en la zona."
		titulo.text = "Plateros"
	elif $ButtonPinos.is_hovered():
		label.text = "Pinos fue fundado en 1594 con el nombre de Real de Nuestra Señora de Sierra de Pinos poco después de que el capitán mestizo (zacatecano) Miguel Caldera vislumbrara \"una magnífica oportunidad para explorar sus ricos suelos\"";
		titulo.text = "Pinos"
	elif $ButtonPuebla.is_hovered():
		label.text = "Puebla, estado mexicano ubicado en el centro-sur del país, destaca por su rica historia y patrimonio cultural. La ciudad de Puebla, capital del estado, fue fundada en 1531 y su centro histórico es reconocido como Patrimonio de la Humanidad. Renombrada por su arquitectura colonial, la ciudad alberga joyas como la Catedral, la Capilla del Rosario y el Zócalo.";
		titulo.text = "Puebla"
		
func _on_button_fresnillo_pressed():
	transition.play("fade_out")
	scene = preload("res://Escenas/Mina_el_Eden_Entrada.tscn");
	opc = "ZAC";

func _on_button_jerez_pressed():
	transition.play("fade_out")
	opc = "JEREZ"
	scene = preload("res://Escenas/map.tscn");

func _on_button_plateros_pressed():
	transition.play("fade_out")
	opc = "PLAT";
	scene = preload("res://Iglesia.tscn");

func _on_button_volver_pressed():
	transition.play("fade_out")
	opc = "SALIR"
	scene = preload("res://Escenas/MenuPrincipal.tscn");

func _on_transicion_animation_finished(anim_name):
	if opc == "JEREZ":
		get_tree().change_scene_to_packed(scene)
	elif opc == "PLAT":
		get_tree().change_scene_to_packed(scene)
	elif opc == "ZAC":
		get_tree().change_scene_to_packed(scene)
	elif opc == "PINOS":
		get_tree().change_scene_to_packed(scene) # Escena del museo
	elif opc == "SALIR":
		get_tree().change_scene_to_file("res://Escenas/MenuPrincipal.tscn")


func _on_button_pinos_pressed():
	transition.play("fade_out")
	opc = "PINOS"
	scene = preload("res://Escenas/Mapa.tscn");

func _on_button_puebla_pressed():
	transition.play("fade_out")
	#scene = preload("res://Mapas/MapaPrincipal.tscn");
