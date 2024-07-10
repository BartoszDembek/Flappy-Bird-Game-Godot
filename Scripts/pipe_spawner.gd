extends Node

var pipe_scene = preload("res://Scenes/pipes.tscn")

func reset_spawn():
	for n in $Spawner.get_children():
		$Spawner.remove_child(n)

func star_spawn():
	$SpawnTimer.start()
	

func spawn_pipe():
	var pipe = pipe_scene.instantiate() as Pipes
	$Spawner.add_child(pipe)
	var viewport_rect = get_viewport().get_camera_2d().get_viewport_rect()
	pipe.position.x = viewport_rect.end.x
	var half_height = viewport_rect.size.y / 2
	pipe.position.y = randf_range(viewport_rect.size.y * 0.15 - half_height,viewport_rect.size.y * 0.65 - half_height)
	pipe.set_speed(150)

func _on_spawn_timer_timeout():
	spawn_pipe()

func stop_spawn():
	$SpawnTimer.stop()
	for pipe in $Spawner.get_children().filter(func (child): return child as Pipes):
		(pipe as Pipes).speed = 0

	
