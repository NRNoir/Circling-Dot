extends Control


func _on_quit_pressed():
	print("pressed")
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")# Replace with function body.
