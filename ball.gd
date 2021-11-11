extends Area2D

export var speed = 200
var velocity = Vector2()
var move = false
var freeze = true
var specialSpeed = false


func _ready():
	randomize()
	velocity = Vector2(rand_range(-3,3),rand_range(-3,-2))
	
func _process(delta):
	if !freeze:
		position += velocity * delta * speed
		var slen = velocity.length()
		var scos = (-velocity.y/slen)
		var wspx = abs(velocity.x)/velocity.x
		$particles.rotation_degrees = wspx*rad2deg(acos(scos))
	
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
func setSpecialSpeed(var t):
	if t== true:
		specialSpeed = true
		$particles.visible = true
	if t == false:
		specialSpeed = false
		$particles.visible = false
