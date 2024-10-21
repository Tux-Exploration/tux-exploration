extends CharacterBody2D

const fast = 100.0 # fast because he goes fast. this is tux's speed.
var current_dir = "none" # the direction.

func _ready():
	$AnimatedSprite2D.play("idle")

func _physics_process(_delta):
	player_movement()

func player_movement():
	if Input.is_action_pressed("ui_right"): # TODO: Please change ui_right to something else.
			current_dir = "right"
			play_anim(1)
			velocity.x = fast
			velocity.y = 0 # dont know how this works but ok!
	elif Input.is_action_pressed("ui_left"): # TODO: Please change ui_left to something else.
			current_dir = "left"
			play_anim(1)
			velocity.x = -fast
			velocity.y = 0
	elif Input.is_action_pressed("ui_up"): # TODO: everyone knows what needs to be done
			current_dir = "up"
			play_anim(1)
			velocity.x = 0
			velocity.y = -fast
	elif Input.is_action_pressed("ui_down"): # TODO: kill me.
			current_dir = "down"
			play_anim(1)
			velocity.x = 0
			velocity.y = fast
	else: # basically, when nothing is being pressed, tux freezes in place and doesn't want to move because he is lazy.
		play_anim(0)
		velocity.x = 0
		velocity.y = 0
	
	move_and_slide()

func play_anim(movement):
	var dir = current_dir # sets dir to the current_dir.
	var anim = $AnimatedSprite2D
	
	if dir == "right":
		if movement == 1:
			anim.play("walkright")
		elif movement == 0:
			anim.play("right")
	if dir == "left":
		if movement == 1:
			anim.play("walkleft")
		elif movement == 0:
			anim.play("left")
	if dir == "down":
		if movement == 1:
			anim.play("walkdown")
		elif movement == 0:
			anim.play("down")
	if dir == "up":
		if movement == 1:
			anim.play("walkup")
		elif movement == 0:
			anim.play("up")
