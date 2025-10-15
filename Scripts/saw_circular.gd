extends Area2D

@export_category("Movement Settings")
@export var rotation_speed: float = 2.0 # Velocidade da rotação
@export var radius: float = 50.0      # O raio (tamanho) do círculo

# Variável para guardar o ângulo atual do movimento
var angle: float = 0.0 

# Variável para guardar a posição inicial, que será o centro do círculo
@onready var center_position = global_position

func _ready() -> void:
	# A posição inicial do nó no editor se tornará o centro do círculo.
	pass

func _physics_process(delta: float) -> void:
	# Aumenta o ângulo com o tempo, baseado na velocidade da rotação
	angle += rotation_speed * delta

	# Calcula o deslocamento (offset) a partir do centro usando cosseno para x e seno para y
	var offset = Vector2(cos(angle), sin(angle)) * radius
	
	# Define a nova posição global da serra
	global_position = center_position + offset

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Player"):
		print('Died')
		area.get_parent().die()	
	pass
