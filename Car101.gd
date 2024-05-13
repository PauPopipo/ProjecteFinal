extends CharacterBody2D

var velocitat := 45

var acceleracio : Vector2 = Vector2(0,0)
var direccio : Vector2 = Vector2.UP

@export var ACCELERACIO := 200
@export var DESACCELERACIO := 20
@export var FRENADA := 20
@export var VELOCITAT_ROTACIO := 10

@onready var vvelocitat:Line2D = $Vvelocitat
@onready var vdireccio:Line2D = $Vdireccio
@onready var SoMotor:AudioStreamPlayer2D = $SoMotor
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
	
	vvelocitat.clear_points()
	vvelocitat.add_point(Vector2(0,0))
	vvelocitat.add_point(velocity)
	
	vdireccio.clear_points()
	vdireccio.add_point(Vector2(0,0))
	vdireccio.add_point(direccio*100)
	
	if Input.is_action_pressed("mou adalt"):
		acceleracio = direccio * ACCELERACIO
	
	
	if Input.is_action_pressed("mou dreta"):
		direccio = direccio.rotated(VELOCITAT_ROTACIO * delta)
	
	if Input.is_action_pressed("mou esquerra"):
		direccio = direccio.rotated(-VELOCITAT_ROTACIO * delta)
		
	if Input.is_action_pressed("mou abaix"):
		acceleracio = direccio * -FRENADA
	

	print(acceleracio)
	if acceleracio.length() > 0:
		if not SoMotor.playing:
			$SoMotor.play()
	else:
		print("Atura")
		$SoMotor.stop()
	velocity += acceleracio * delta

	move_and_slide()
	$COTXE.rotation = direccio.angle() + deg_to_rad(90)
	if acceleracio.length() == 0:
		$COTXE/GPUParticles2D.emitting = false
	else:
		$COTXE/GPUParticles2D.emitting = true
