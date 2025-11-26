extends CanvasLayer

@onready var retry_button: Button = $VBoxContainer/Reintentar
@onready var menu_button: Button = $VBoxContainer/VolverAMenu

func _ready() -> void:
	retry_button.pressed.connect(_on_retry_pressed)
	menu_button.pressed.connect(_on_menu_pressed)
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _on_retry_pressed() -> void:
	print("Retry pressed")
	get_tree().paused = false
	get_tree().reload_current_scene()
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _on_menu_pressed() -> void:
	print("Menu pressed")
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/portada.tscn")
