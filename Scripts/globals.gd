extends Node

signal score_change
signal game_change_status
signal game_stop
signal game_reset

var player_score = 0:
	set(value):
		player_score = value
		if player_score >= best_score:
			best_score = player_score
		score_change.emit()

var best_score = 0:
	set(value):
		best_score = value
		
var game_started = false:
	set(value):
		game_started = value
		if game_started:
			game_change_status.emit()	
			
		
var game_stoped = false:
	set(value):
		game_stoped = value
		if game_stoped:
			game_stop.emit()
		else:
			game_reset.emit()
