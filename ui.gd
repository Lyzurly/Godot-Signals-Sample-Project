extends CanvasLayer

@onready var label_lives_val: Label = %Label_Lives_Val
@onready var button: Button = %Button

func _ready() -> void:
	button.pressed.connect(_on_spawn_pressed)
	
func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("Reload"):
		get_tree().reload_current_scene()
	if Input.is_action_just_pressed("Activate"):
		_on_spawn_pressed()

func _on_spawn_pressed() -> void:
	#var spiky: RigidBody2D = load("res://Enemy/spiky.tscn").instantiate()
	#add_child(spiky)
	#spiky.position = Vector2(400,-80)
	var fish: RigidBody2D = load("res://Pickup/fish.tscn").instantiate()
	add_child(fish)
	fish.position = Vector2(400,-80)

var lives: int = 9:
	set(new_lives):
		lives = new_lives
		label_lives_val.text = str(lives)
