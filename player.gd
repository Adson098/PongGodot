extends Area2D

export var speed = 200
export var key_left = "ui_left"
export var key_right = "ui_right"
var rect_size
var window_size
var score
var rect_color
export var colorateSpeed = 0.012
var powerTime
var staminaTime
export var timetoGetPower= 3
var canPower = true

#export var left_key = 

func _ready():
	rect_size = $Sprite.texture.get_size()
	window_size = get_viewport_rect().size
	rect_color = Color(255,255,255)
	score = 0
	powerTime = 0
	staminaTime = 0
	
func _process(delta):
	var velocity = Vector2()
	if canPower == false:
		staminaTime+=delta
		if staminaTime >=timetoGetPower:
			canPower = true
			staminaTime =0
	if Input.is_action_pressed(key_left):
		velocity.x = -1
	if Input.is_action_pressed(key_right):
		velocity.x = 1
	if Input.is_action_pressed("ui_select"):
		if powerTime <= timetoGetPower && canPower == true:
			powerTime += delta
			getPower()
		if  powerTime >= timetoGetPower &&canPower == true:
			powerTime = 0
			resetPower()
		
	if Input.is_action_just_released("ui_select"):
		resetPower()
		powerTime = 0
		
		
		
	
	#velocity.normalized()
	position += velocity * delta * speed
	position.x = clamp(position.x, 0+rect_size.x/2, window_size.x-rect_size.x/2)
	


func _on_player_area_entered(area):
		if area.name =="ball":
			var speedFactor = (1 - modulate.b)+1
			area.newVelocity(rand_range(-3,3),rand_range(2,3)*speedFactor)
			
func score():
	score +=1
	
func getScore():
	return score

func getPower():
	modulate.b -=colorateSpeed
	modulate.g -=colorateSpeed
	
func resetPower():
	modulate.b = 1
	modulate.g = 1
	canPower = false

