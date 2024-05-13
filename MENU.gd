extends Control



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_pressed():
	get_tree().change_scene_to_file("res://Menu_mapas.tscn")
	




	


func _on_credits_pressed():
	get_tree().change_scene_to_file("res://CREDITS.tscn")
	


func _on_options_pressed():
	get_tree().change_scene_to_file("res://options.tscn")
