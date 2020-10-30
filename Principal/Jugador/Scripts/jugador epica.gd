extends KinematicBody2D
class_name Jugador

#------Variables-------
var velocidad: int = 100
var animacion: String = ""

#------Nodos guardados en variables 
onready var animaciones: AnimatedSprite = $sprite
onready var mira: RayCast2D = $RayCast2D

func _physics_process(delta):
	var movimiento: Vector2 = Vector2()
	
	if Input.is_action_pressed("ui_up"): #----arriba
		movimiento.y -= velocidad
		mira.set_cast_to(Vector2(0,-50))
		animacion = "mov_arriba"
	elif mira.get_cast_to() == Vector2(0,-50):
		animacion = "quieto_arriba"
		
	if Input.is_action_pressed("ui_down"):#-----abajo
		movimiento.y += velocidad
		mira.set_cast_to(Vector2(0,50))
		animacion = "mov_abajo"
	elif mira.get_cast_to() == Vector2(0,50):
		animacion = "quieto_abajo"
		
	if Input.is_action_pressed("ui_left"):#-----izquierda
		movimiento.x -= velocidad
		mira.set_cast_to(Vector2(-50,0))
		animacion = "mov_izquierda"
	elif mira.get_cast_to() == Vector2(-50,0):
		animacion = "quieto_izquierda"

	if Input.is_action_pressed("ui_right"):#-----derecha 
		movimiento.x += velocidad
		mira.set_cast_to(Vector2(50,0))
		animacion = "mov_derecha"
	elif mira.get_cast_to() == Vector2(50,0):
		animacion = "quieto_derecha"

	move_and_slide(movimiento)
	animaciones.play(animacion)
	
