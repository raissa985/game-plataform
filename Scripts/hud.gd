extends CanvasLayer


func _process(delta: float) -> void:
	
	$Score/ScoreText.text = str(Global.score)
	
	pass
