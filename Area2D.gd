extends Area2D

var is_sound_played = false

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player":
			if is_sound_played == false:
				$death_sound.play()
				is_sound_played = true
			


func _on_death_sound_finished():
	get_tree().reload_current_scene()
	is_sound_played = false
