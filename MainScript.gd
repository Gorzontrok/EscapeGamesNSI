extends Node

## Level completer
var levelComplete = false
## La fin du iveau a été informer au joueur
var has_told_end = false

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("UI/EnterCode").visible = false #Cache l'Interface de l'ordinateur
	$ContainerColor.visible = false
	$PauseMenu.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if levelComplete and !has_told_end: # Montre le msg de fin (pas du tout)
		has_told_end = true
		print("END")

func _input(event):
	if $Player.can_move and event is InputEventKey and event.scancode == KEY_ESCAPE:
		$ContainerColor.visible = false
		$PauseMenu.visible = true
		$Player.mouse_visible = true
		$Player.can_move = false
