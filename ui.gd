extends CanvasLayer

@onready var label_lives_val: Label = %Label_Lives_Val

var lives: int = 9:
	set(new_lives):
		lives = new_lives
		label_lives_val.text = str(lives)
		
func _ready() -> void:
	SignalBus.bonk.connect(_on_bonk)
	
func _on_bonk() -> void:
	lives -= 1

func _on_button_pressed() -> void:
	var spiky: RigidBody2D = load("res://Enemy/spiky.tscn").instantiate()
	add_child(spiky)
	spiky.position = Vector2(400,-80)
