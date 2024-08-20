extends Node
var speedvar = preload("res://Speedrun_Timer.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.time = 0
	var speedvar_instance = Global.speedvar.instance()
	add_child(speedvar_instance)
	$AudioStreamPlayer.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
