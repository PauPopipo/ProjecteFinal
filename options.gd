extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_soundon_pressed():
	var master = AudioServer.get_bus_index("Master")
	AudioServer.set_bus_mute(master, false)


func _on_soundoff_pressed():
	var master = AudioServer.get_bus_index("Master")
	AudioServer.set_bus_mute(master, true)
	
