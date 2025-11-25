extends Control


func _on_start_game_pressed():

	get_tree().change_scene_to_file("res://scenes/first_scene.tscn")


func _on_exit_pressed():

	get_tree().quit() # Replace with function body.
