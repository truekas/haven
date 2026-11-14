extends CharacterBody2D
@onready var sprite: Sprite2D = $Sprite2D
@export var fade_duration: float = 0.1 
@export var start_delay: float = 0.0
const WIN_SCENE = preload("res://cutscene_win.tscn")
var hits = 0;

func hit():
	hits += 1;
	var tween := create_tween()
	sprite.modulate = Color.RED;
	tween.tween_property(sprite, "modulate", Color.WHITE, 0.2);
	print("HIT FUNC")
	if hits >= 5:
		sprite.modulate.a = 1.0
		
		if start_delay > 0.0:
			tween.tween_interval(start_delay)
		
		tween.tween_property(self, "sprite:modulate:a", 0.0, fade_duration)	
		tween.tween_callback(func(): get_tree().change_scene_to_packed(WIN_SCENE));
