extends Node

var countDown = 3
signal endOfCountingDown()

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_coutnDownMenuTimer_timeout():
	if countDown > 0:
		countDown -= 1
		$countDownMenu.text = str(countDown)
	else:
		$countDownMenu.visible = false
		emit_signal("endOfCountingDown")
		


func _on_main_runCountingDown():
	$countDownMenu.visible = true
	$countDownMenuTimer.start()
