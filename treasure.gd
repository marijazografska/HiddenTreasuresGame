extends Area3D

signal collected

#var  score = 0
#var score_label

#func _ready():
	#connect("body_entered", Callable(self, "_on_body_entered"))
	#score_label = get_node("../CanvasLayer/ScoreLabel")

func _on_body_entered(body):
	if body is CharacterBody3D: 
		#score = score + 1
		#score_label.text = "Score: " + str(score)
		body.update_score()
		print("Collided with: ", body.name) 
		emit_signal("collected")
		queue_free()
