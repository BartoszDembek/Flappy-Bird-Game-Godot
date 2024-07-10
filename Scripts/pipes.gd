extends Node2D

class_name Pipes

signal bird_entered
signal point_scored

var speed = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_speed(new_speed):
	speed = new_speed

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= speed * delta


func _on_bird_entered(_body):
	Globals.game_stoped = true

func _on_score_area_entered(_body):
	Globals.player_score += 1
	$ScoreSoundPlayer.play()


func _on_visible_on_screen_notifier_2d_screen_exited():
	$DestroyTimer.start()


func _on_destroy_timer_timeout():
	queue_free()
