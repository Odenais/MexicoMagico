extends ParallaxBackground

func _physics_process(delta):
	scroll_base_offset -= Vector2(10, 0) * delta
