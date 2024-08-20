extends Label

var timer_on = false

# Declare mesber variables here. Examples:
# var a = 2
# var b = "text"
# Called when the node enters the scene tree for the first time.
func _process(delta):
	if timer_on:
		Global.time += delta
	
	var mils = fmod(Global.time, 1) * 1000
	var secs = fmod(Global.time, 60)	
	var mins = fmod(Global.time, 60 * 60) / 60
	var hours = fmod(Global.time, 60 * 60 * 60) / 3600
	var time_passed = "%02d : %02d : %02d : %03d" % [hours, mins, secs, mils]
	
	$".".text = time_passed

func _ready():
	timer_on = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
