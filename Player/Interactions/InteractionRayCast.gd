extends RayCast

var current_collider

onready var interaction_label: Label = get_node("/root/Main/UI/InteractionLabel")

func _ready():
	set_interaction_text("")

func _process(_delta):
	var collider = get_collider()
	
	if is_colliding() and collider is Interactable:
		if current_collider != collider:
			current_collider = collider
		
		set_interaction_text(collider.get_interaction_text())
		if Input.is_action_just_pressed("Interact"):
			collider.interact()
	elif current_collider:
		current_collider = null
		set_interaction_text("")

func set_interaction_text(text: String) -> void:
	if !text:
		interaction_label.set_text("")
		interaction_label.set_visible(false)
	else:
		interaction_label.set_text("Appuyez sur E pour %s" %  text)
		interaction_label.set_visible(true)
