extends CharacterBody2D

var velocitat := 45

var acceleracio : Vector2 = Vector2(0,0)
var direccio : Vector2 = Vector2.UP

@export var ACCELERACIO := 200
@export var DESACCELERACIO := 20
@export var FRENADA := 200
@export var VELOCITAT_ROTACIO := 10



func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print_debug(velocity)
	#print_debug(direccio)
	#print_debug(velocity.dot(direccio))
	#print_debug("------------------------------------------------")
	if velocity.length() > 0:
		var nova_acceleracio = velocity.normalized() * (-DESACCELERACIO)
		if nova_acceleracio.dot(acceleracio) < 0:
			acceleracio = Vector2.ZERO
		else:
			acceleracio = nova_acceleracio 
	else:
		acceleracio = Vector2.ZERO
	
	if Input.is_action_pressed("mou adalt 2"):
		acceleracio = direccio * ACCELERACIO
	
	
	if Input.is_action_pressed("mou dreta2"):
		direccio = direccio.rotated(VELOCITAT_ROTACIO * delta)
	
	if Input.is_action_pressed("mou esquerra 2"):
		direccio = direccio.rotated(-VELOCITAT_ROTACIO * delta)
		
	if Input.is_action_pressed("mou abaix2"):
		acceleracio = direccio * -FRENADA
	

	velocity += acceleracio * delta

	move_and_slide()
	$cotxe2.rotation = direccio.angle() + deg_to_rad(90)
	
	if acceleracio.length() == 0:
		$cotxe2/CPUParticles2D.emitting = false
	else:
		$cotxe2/CPUParticles2D.emitting = true
	
