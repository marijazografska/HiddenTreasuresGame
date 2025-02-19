extends Node3D

var time_left = 60  
var collected_treasures = 0
var total_treasures = 5  
var game_over = false

@onready var timer_label = $CanvasLayer/TimerLabel  
@onready var game_timer = $GameTimer  

func _ready():
	print("Starting Timer...")
	game_timer.start()  
	update_timer_display()  

func _on_GameTimer_timeout():
	if game_over:
		return  

	time_left -= 1  
	update_timer_display()  

	if time_left <= 0:
		end_game(false)  

func _on_Treasure_treasure_collected():
	collected_treasures += 1
	if collected_treasures >= total_treasures:
		end_game(true)  

func end_game(win):
	game_over = true  
	game_timer.stop()  

	if win:
		timer_label.text = "🎉 You Win!"
	else:
		timer_label.text = "⏳ Time's Up! You Lose!"

	get_tree().paused = true  

func update_timer_display():
	timer_label.text = "Time: " + str(time_left) + "s" 
