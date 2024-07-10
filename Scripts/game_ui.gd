extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	$MarginContainer/Score.visible = false
	$MarginContainer/Logo.visible = true
	$MarginContainer/VBoxContainer.visible = false
	Globals.game_change_status.connect(change_game_status)
	Globals.score_change.connect(update_score)
	update_score()


func update_score():
	$MarginContainer/Score.text = str(Globals.player_score)
	$MarginContainer/VBoxContainer/Panel/ScorePanel.text = str(Globals.player_score)
	$MarginContainer/VBoxContainer/Panel/BestPanel.text = str(Globals.best_score)

func change_game_status():
	$MarginContainer/Logo.visible = false
	$MarginContainer/Score.visible = true

func show_game_over_screen():
	$MarginContainer/Score.visible = false
	$MarginContainer/VBoxContainer.visible = true

func hide_game_over_screen():
	$MarginContainer/Logo.visible = true
	$MarginContainer/Score.visible = false
	$MarginContainer/VBoxContainer.visible = false

func _on_button_pressed():
	Globals.game_stoped = false
