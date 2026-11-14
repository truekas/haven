extends Control

@onready var ammo: Label = $MarginContainer/Label;

func update_ammo(current: int):
	ammo.text = str(current);
