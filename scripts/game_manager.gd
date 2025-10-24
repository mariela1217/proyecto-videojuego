extends Node

var puntuacion = 0

@onready var etiqueta_puntuacion: Label = $EtiquetaPuntuacion

func incrementa_un_punto():
	puntuacion += 1
	etiqueta_puntuacion.text = "Recogiste "+str(puntuacion)+" Manzanas"
