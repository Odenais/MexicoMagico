extends Node2D

# Agrega referencias a las escenas que deseas instanciar
const character_scene1 = preload("res://Escenas/enemy.tscn")
var random_generator := RandomNumberGenerator.new()

func _ready():
	random_generator.randomize() # Inicializa el generador aleatorio
	generate_random_characters()
	

func generate_random_characters():
	var num_characters_to_generate = random_generator.randi_range(0,20)
	for i in num_characters_to_generate:
		var character_instance = character_scene1.instantiate()
	# Configura propiedades aleatorias si es necesario
		var x = get_window().size.x / get_window().size.y
		character_instance.position = Vector2(random_generator.randi_range(300, x), random_generator.randi_range(300, x))
		add_child(character_instance)
