extends Control



func setup(final_score):

	$"VBoxContainer/Final Score".text = "Final Score : " + str(final_score)
	
# relance le jeu et retire la pause
func _on_retry_pressed():
	
	get_tree().paused = false 
	get_tree().change_scene_to_file("res://scenes/first_scene.tscn")
	queue_free()
	print("presse retry")
	
	
	
# retour au menu du jeu et retire la pause du jeu
func _on_main_menu_pressed():
	
	get_tree().paused = false 
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	print("pressed menu")
	
# sort du jeu 
func _on_exit_pressed():
	
	get_tree().quit()
	print("exit menu")
