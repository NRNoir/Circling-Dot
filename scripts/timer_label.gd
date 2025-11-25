extends Label

# définit le temps du timer
var timer_left = 15

@onready var sprite_node = get_node("/root/first_scene/Sprite2D")
# conection du signal émit par le timer et affichage du timer sur le label

func _ready():
	text = str(timer_left)
	$Timer.connect("timeout", Callable(self, "_on_timer_timeout"))
	sprite_node.connect("add_time", Callable(self, "_on_add_time"))
	
	
func _on_add_time(extra_time):
	
	timer_left += extra_time
	text = str(timer_left)
	
	
# réduction du temps de 1 chaque seconde
func _on_timer_timeout():
	
	timer_left -= 1 # réduit de 1 le timer
	text = str(timer_left) # affiche le timer
	
	
# changement de couleur du text quand le timer arrive à 10s
	if timer_left <= 10:
		self.add_theme_color_override("font_color", Color.RED)
	
	
# permet d'afficher le message "Temps écoulé quand le timer arrive à 0 et de mettre le jeu en pause 
	if timer_left < 0:
		$Timer.stop() # arrete de le timer
		text = "Game Over !" # affiche le text Game Over 
		
		
# permet d'appeler / instancier le Game Over HUD quand le timer arrive à zero  
		var game_over_scene = preload("res://scenes/game_over_hud.tscn")
		var game_over_instance = game_over_scene.instantiate()
		get_tree().root.add_child(game_over_instance)
		
# permet d'afficher le score réalisé en récupérant la variable score présent dans le script du Label portant le nom "Score"
		var score_node = get_node("/root/first_scene/Score") # on récupère le node Score pour pouvoir lire la variable score
		var current_score = score_node.score # création de la variable current_score pour stocker la valeur actuelle du score, puis on accède à la variable avec score_node.score

# transmet le score au menu Game Over HUD pour qu'il puisse l'afficher
		game_over_instance.setup(current_score)
		
		
		get_tree().paused = true # met le jeu en pause
		
		return	
