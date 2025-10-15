extends Area2D

@export var level = "Digite o caminho do level"

# Carrega a cena de vitória para que possamos instanciá-la
var win_screen_scene = preload("res://Scenes/WinScreen.tscn")

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Player"):
		# Se a variável 'level' for "WIN", aciona a tela de vitória
		if level == "WIN":
			# Congela o jogador para ele não se mover durante a animação
			area.get_parent().set_physics_process(false)
			
			# Cria uma instância da cena de vitória e a adiciona à árvore de cena
			var win_screen = win_screen_scene.instantiate()
			get_tree().root.add_child(win_screen)
		else:
			# Comportamento normal: vai para a próxima fase
			get_tree().change_scene_to_file(level)
	
	pass
