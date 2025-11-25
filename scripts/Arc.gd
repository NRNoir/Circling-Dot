extends Node2D

func _draw():
	#déclaration des paramètres du cercle
	var center: Vector2 = Vector2(545, 370)
	var radius: float = 153
	var start_angle: float = 0
	var end_angle: float =360
	var point_count: int = 50
	var color: Color = Color.BLACK
	var width: float = 0.8
	var antialiased: bool = true
	
	#dessin de l'arc
	draw_arc(center, radius, start_angle, end_angle, point_count, color, width, antialiased)
