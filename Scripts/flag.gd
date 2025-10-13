extends Area2D

@export var level = "Digite o caminho do level"

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Player"):
		get_tree().change_scene_to_file(level)
	
	pass
