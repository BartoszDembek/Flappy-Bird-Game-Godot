extends Node

func _ready():
	Globals.game_change_status.connect(change_game_status)
	Globals.game_stop.connect(stop_game)
	Globals.game_reset.connect(reset_game)


func _on_ground_body_entered(_body):
	Globals.game_stoped = true
	
func change_game_status():
	$PipeSpawner.star_spawn()
	
func stop_game():
	$HitSoundPlayer.play()
	$Ground.stop_ground()
	$Bird.stop_bird()
	$PipeSpawner.stop_spawn()
	await $FadeScene.play_animation()
	$GameUi.show_game_over_screen()
	
func reset_game():
	await $FadeScene.play_animation()
	$Ground.start_ground()
	$Bird.start_bird()
	Globals.game_started = false
	$GameUi.hide_game_over_screen()
	Globals.player_score = 0
	$PipeSpawner.reset_spawn()
