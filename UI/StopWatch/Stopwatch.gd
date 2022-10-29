extends Label


## GameState Node
onready var gamestate : GameState = get_node("/root/Main/GameState")

var time_elapsed := 0.0

func _process(delta):
	if !gamestate.game_is_paused:
		time_elapsed += delta
		text = _format_seconds(time_elapsed, true)

func _format_seconds(time : float, use_milliseconds : bool) -> String:
	var minutes := time / 60
	var seconds := fmod(time, 60)
	if not use_milliseconds:
		return "%02d:%02d" % [minutes, seconds]
	var milliseconds := fmod(time, 1) * 100
	return "%02d:%02d:%02d" % [minutes, seconds, milliseconds]