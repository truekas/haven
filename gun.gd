extends Node2D

const BULLET = preload("res://bullet.tscn");
const MUZZLEBLAST = preload("res://muzzle_blast.tscn")
signal ammo_changed(new: int)
@onready var MUZZLE: Marker2D = $Muzzle;
@export var ammo = 100;

func _process(delta: float) -> void:
	look_at(get_global_mouse_position())
	rotation_degrees = wrap(rotation_degrees, 0, 360);
	if rotation_degrees > 90 and rotation_degrees < 270:
		scale.y = -1;
	else:
		scale.y = 1;
	if Input.is_action_just_pressed("shoot"):
		ammo -= 1;
		ammo_changed.emit(ammo);
		var bullet_instance = BULLET.instantiate();
		var muzzle_blast = MUZZLEBLAST.instantiate();
		get_tree().root.add_child(bullet_instance);
		get_tree().root.add_child(muzzle_blast);
		bullet_instance.global_position = MUZZLE.global_position;
		muzzle_blast.global_position = MUZZLE.global_position;
		bullet_instance.rotation = rotation;
		muzzle_blast.rotation = rotation;
