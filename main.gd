extends Node2D

enum state {MENU, GAME, PAUSE}
var current_state = state.MENU
signal runCountingDown

func _ready():
	changeState(state.MENU)
	
func _process(delta):
	if Input.is_key_pressed(KEY_ENTER) && current_state == state.MENU:
		changeState(state.GAME)
	if Input.is_action_just_pressed("ui_cancel"):
		#changeState(state.PAUSE)
		print("gowno")


func score():
	$player.score()
	

func changeState(var stat):
	current_state = stat
	if current_state == state.GAME:
		$HUD/score.visible = false
		$HUD/message.visible = false
		emit_signal("runCountingDown")

		
		
	if current_state == state.MENU:
		$HUD/message.visible = true
	
	if current_state == state.PAUSE:
		pass
		
		
		

		


func _on_CountDownManager_endOfCountingDown():
	$ball.freeze(false)
	$HUD/score.visible = true


func _on_bottom_wall_PlayerScore():
	$player.score()
	$HUD/score.rescore($player.getScore(),$player2.getScore())
	$ball.resetPosition()


func _on_top_wall_PlayerScore():
	$player2.score()
	$HUD/score.rescore($player.getScore(),$player2.getScore())
	$ball.resetPosition()
