#-------------------------------------------------------------------------------
#       PROGRAMACION 1 - TRABAJO PRACTICO - 2026
#-------------------------------------------------------------------------------
# 
# EQUIPO N° 04:
# 
# - Downes, Maria Carla
# - Miguel, Tatiana Paula
# - Monzon, Nicolas
# - Ricci, Leandro
#
# ARCHIVO: jugar.R
#
# Este archivo debe ser ejecutado desde una terminal con la instruccion Rscript
# jugar.R, desde el directorio en el que este guardado junto con cualquier otro
# archivo que sea creado como parte de la solucion.
#-------------------------------------------------------------------------------

library("farkle")

titulo("VAMOS A JUGAR FARKLE", ancho = 120)

texto_lento("Farkle es un juego de dados en el que dos jugadores compiten con el objetivo de llegar exactamente a 1000 puntos
La partida se desarrolla en multiples rondas, en cada una los jugadores participan respetando un orden. 
Dentro de cada turno, se pueden lanzar los dados una o mas veces, dependiendo del resultado de cada tirada. 
Gana el primero en alcanzarlo sin pasarse.")

cat ("----------------------------------------------------------------------------------------------------------------------\n")

texto_lento("REGLAS DEL JUEGO
* Cada jugador lanza 5 dados.
* Los 1 suman 100 puntos y los 5 suman 50 puntos.
* Luego de la tirada, el jugador decide si vuelve a hacerlo o no. Si elige seguir tirando, lanza los dados que no sumaron 
puntos anteriormente.
* Si el jugador no suma puntos en la tirada, pierde todo lo acumulado hasta es momento en el turno.")

cat ("----------------------------------------------------------------------------------------------------------------------\n")

texto_lento("CASOS ESPECIALES
* Si en una tirada todos los dados suman puntos, el jugador puede volver a tirar los 5 dados.
* Si en una tirada el jugador supera el puntaje máximo, es decir los 1000 puntos, pierde todos los puntos acumulados en 
el turno.
* Si ambos jugadores consiguen 1000 puntos en la misma ronda, se considera empate.")

pausa(mensaje="SI ESTAS LISTO")

limpiar_consola()

titulo("AHORA SI, A JUGAR", ancho = 120)

# pedir nombres
cat("Nombre del jugador 1: ")
jugador1 <- leer_palabra()
cat("Nombre del jugador 2: ")
jugador2 <- leer_palabra()
cat("\n")
cat ("Genial. La partida es",jugador1,"VS",jugador2,".")
cat("\n")

# El puntaje objetivo para ganar es:

puntaje_objetivo <- 1000

# Puntajes totales de cada jugador:

puntaje1 <- 0
puntaje2 <- 0

ronda <- 0

#¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡TENEMOS QUE VER QUE ITERACION USAMOS!!!!!!!
ronda <- ronda + 1
titulo(paste("VAMOS A JUGAR LA RONDA", ronda))

#=================================================================
#JUGADOR 1
#=================================================================

cat("Es el turno de:", jugador1, "| Puntaje:", puntaje1)
cat("\n")

dados_disponibles<- 5
puntos_turno <- 0

cat("Tenés", dados_disp,"dado/s")
tirada <- tirar_dados(dados_disp)
cat("\n")
pausa(mensaje="Para hacer tu tirada...")
cat("Resultado de tirada:", mostrar_dados(tirada))
cat("\n")

#Cuenta de 1 y 5 en la tirada 

unos <- contar_dados(tirada,1)
cincos <- contar_dados(tirada,5)
puntos <- (unos*100)+(cincos*50)

#Si no se obtienen 1s y/o 5s

  if (puntos == 0){
    texto_lento("No obtuviste ni 1 ni 5. Perdes el turno")
    puntos_turno <- 0
  }
cat("\n")
#Si se obtienen 1s y/o 5s, sumar el puntaje

puntos_turno <- puntos + puntos_turno
texto_lento("Puntos de esta tirada:", puntos, "| Puntaje acumulado:", puntos_turno)

#Evaluar si no supera el puntaje_objetivo

  if (puntaje1 + puntos_turno > puntaje_objetivo){
    texto_lento("Te pasas de 1000! Perdes los puntos del turno.")
    puntos_turno <- 0
  }
#Contar cantidad de dados restantes
dados_disponibles <- dados_disponibles - unos - cincos

#Decidir si seguir o no 
cat("\n")
texto_lento("Te quedan", dados_disponibles, "dado/s.")
decision <- leer_opciones("¿Que queres hacer?", "Sigo tirando", "Me detengo")
  if (decision == 2){
#DETENER BUCLE
}

#Si se usaron todos los dados se puede volver a tirar con 5
cat("\n")
  if (dados_disponibles == 0) {
  texto_lento("¡Usaste todos los dados!")
  decision <- leer_opciones("¿Que haces?", "Tiro de nuevo con 5 dados", "Me detengo")
  }
  if (decision == 1) {
    dados_disponibles <- 5
#DETENER BUCLE
  }
