extends Sprite2D

# déclare un signal de changement de score pour le label
signal score_changed(new_score)

# déclare le signal qui va ajouter du temps à chaque fois que l'on clique sur le sprite
signal add_time(extra_time)

# variables concernant les mouvement du cercle
var speed_rotation = 0.5
var radius = 150.0
var angle = 0.0
var center = Vector2(545, 370)

# initialise la variable pour compter les points
var score = 0

# fonction qui dès le lancement du jeu (_ready) définit la taille du sprite
func _ready():
	
	scale.x = 0.3
	scale.y = 0.3

# fonction qui contrôle la rotation du cerlce et sa position
func _process(delta):
	angle += speed_rotation * delta
	position.x = center.x + cos(angle) * radius
	position.y = center.y + sin(angle) * radius

# fonction qui enregistre l'action du clique gauche de la souris
func _input(event):
	if event.is_action_pressed("click"): 
			if is_pixel_opaque(get_local_mouse_position()):
				
				# ajoute +10 au score et émet le score pour modifier automatiquement le label 
				score += 10
				emit_signal("score_changed", score)
				
				
				# augmente la vitesse de rotation du sprite dès que l'on clique dessus
				speed_rotation += 0.1
				
				# diminue la taille du sprite dès que l'on clique dessus
				scale.x -= 0.003
				scale.y -= 0.003
				
				# ajoute +1 au timer et émet le temps pour modifier automatiquement le label du timer 
				emit_signal("add_time", 1)
				
				
				
