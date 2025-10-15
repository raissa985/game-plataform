extends CanvasLayer

func _ready():
	# Pausa o jogo, mas permite que as animações desta tela continuem.
	get_tree().paused = true
	
	# Cria um timer para voltar ao menu principal após 4 segundos.
	await get_tree().create_timer(0.4, true, true, true).timeout
	
	# Despausa o jogo antes de mudar de cena para evitar problemas.
	get_tree().paused = false
	
	# Reinicia a pontuação global para um novo jogo.
	Global.score = 0
	
	# Muda para a cena do level 1 (ou um menu principal, se você tiver um).
	get_tree().change_scene_to_file("res://Scenes/level_1.tscn")
