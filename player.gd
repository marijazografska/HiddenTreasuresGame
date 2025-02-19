extends CharacterBody3D
@export var look_speed = 1.0 

var camera: Camera3D
var speed = 5
var jump_strength = 10
var gravity = 20
var score_label
var score = 0  
var victory_screen 

func _process(delta):
	var direction = Vector3()
	
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_up"):
		direction.z -= 1
	if Input.is_action_pressed("ui_down"):
		direction.z += 1
		
	direction = direction.normalized()
	velocity.x = direction.x * speed
	velocity.z = direction.z * speed

	if is_on_floor():
		if Input.is_action_just_pressed("ui_accept"):
			velocity.y = jump_strength
	#else:
		#velocity.y -= gravity * delta
		
	move_and_slide()

func _ready():
	score_label = get_node("../CanvasLayer/ScoreLabel")
	camera = $Camera3D 
	victory_screen = get_node("../VictoryScreen") 
	victory_screen.visible = false 
	add_to_group("player")

func update_score():
	score += 1
	score_label.text = "Score: " + str(score)
	if score >= 5:
		show_victory_screen()

func show_victory_screen():
	victory_screen.visible = true
	get_tree().paused = true
