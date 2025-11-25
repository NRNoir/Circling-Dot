extends Label


var score = 0


# connect le signal "score_changed" émit par le scirpt Cercle Movement à la fonction _on_score_changed du script actuel "self / Label"
func _ready():
	get_node("/root/first_scene/Sprite2D").connect("score_changed", Callable(self, "_on_score_changed"))
	print("label ready, trying to connect")

func _on_score_changed(new_score):
	score = new_score
	text = "Score : " + str(new_score)
