extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var mils = fmod(Global.time, 1) * 1000
	var secs = fmod(Global.time, 60)	
	var mins = fmod(Global.time, 60 * 60) / 60
	var hours = fmod(Global.time, 60 * 60 * 60) / 3600
	var time_passed = "Your time: %02d : %02d : %02d : %03d" % [hours, mins, secs, mils]
	$Label.text = time_passed
	$Timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	get_tree().change_scene("res://Main Menu.tscn")
