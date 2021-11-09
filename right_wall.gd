extends Area2D

func _ready():
	pass

func _on_right_wall_area_entered(area):
	if area.name =="ball":
		area.newVelocity(-area.getVelocity().x, area.getVelocity().y)
