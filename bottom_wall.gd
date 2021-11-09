extends Area2D

signal PlayerScore

func _ready():
	pass 

func _on_bottom_wall_area_entered(area):
	emit_signal("PlayerScore")
