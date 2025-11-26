extends Node2D

func _ready():
	var player = get_node_or_null("player")
	if player:
		player.player_died.connect(_on_player_died)

func _on_player_died(type):
	show_game_over_menu()

func show_game_over_menu():
	var ui = preload("res://scenes/game_over_ui.tscn").instantiate()
	add_child(ui)

	# Pausar todo el juego
	get_tree().paused = true

	# Asegurar que la UI siga funcionando
	ui.process_mode = Node.PROCESS_MODE_ALWAYS
