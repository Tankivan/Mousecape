extends Node
func _ready():
	var speedvar_instance = Global.speedvar.instance()
	add_child(speedvar_instance)
	$Player/Sprites.flip_h = true
	$AudioStreamPlayer.play()
