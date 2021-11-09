extends Area2D

export var speed = 200
var velocity = Vector2()
var move = false
var freeze = true


func _ready():
	randomize()
	print("gowno3")
	velocity = Vector2(rand_range(-3,3),rand_range(-3,-2))
	
func _process(delta):
	if !freeze:
		position += velocity * delta * speed
	
func newVelocity(var x, var y):
	velocity= Vector2(x,y)

func getVelocity():
	return velocity
func getMove():
	return freeze
func freeze(var tof):
	freeze = tof
func resetPosition():
	position = get_viewport_rect().size/2
	velocity = Vector2(rand_range(-3,3),rand_range(-3,-2))
