extends Sprite2D

@export var fade_duration: float = 0.1 
@export var start_delay: float = 0.0

func _ready() -> void:
	modulate.a = 1.0
	var tween := create_tween()
	
	if start_delay > 0.0:
		tween.tween_interval(start_delay)
	
	tween.tween_property(self, "modulate:a", 0.0, fade_duration)	
	tween.tween_callback(queue_free)
