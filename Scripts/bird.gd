extends CharacterBody2D

var gravity = 900
@onready var animation_player = $AnimationPlayer
var max_speed = 400
var jump_force = 300
var rotation_speed = 2

func _ready():
	start_bird()

func _physics_process(delta):
	if Input.is_action_just_pressed("jump") && !Globals.game_stoped:
		if !Globals.game_started:
			Globals.game_started = true
		bird_jump()
	
	if !Globals.game_started:
		return
	
	velocity.y += gravity * delta
	velocity.y = min(velocity.y,max_speed)
	
	move_and_collide(velocity * delta)
	
	if velocity.y > 0 && rad_to_deg(rotation) < 90:
		rotation += rotation_speed * deg_to_rad(1)
	elif velocity.y < 0 && rad_to_deg(rotation) > -30:
		rotation -= rotation_speed * deg_to_rad(1)

func bird_jump():
	animation_player.play("flap_wings")
	velocity.y -= jump_force
	rotation = deg_to_rad(-30)
	$FlapSoundPlayer.play()
	
func start_bird():
	velocity = Vector2.ZERO
	rotation = deg_to_rad(0)
	gravity = 900
	animation_player.play("idle")
	
func stop_bird():
	animation_player.stop()
	gravity = 0
	velocity = Vector2.ZERO
