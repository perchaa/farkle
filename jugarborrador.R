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


cat(jugador1,":", puntaje1, "pts.\n")
cat(jugador2,":", puntaje2, "pts.\n")
#=================================================================
#JUGADOR 1
#=================================================================
cat("--------------------------------------------------\n")

cat("Es el turno de:", jugador1, "| Puntaje:", puntaje1, "\n")

dados_disponibles<- 5
puntos_turno <- 0   #FORZAR RESULTADOS CON 950!!!!!

cat("Tenés", dados_disp,"dado/s")
tirada <- tirar_dados(dados_disp)
# tirada <- c(2, 3, 3, 6, 2) # FORZAR RESULTADOS CON O SIN 1 Y 5 !!!!!!!!!
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
  puntaje1 <- puntaje1 + puntos_turno
  texto_lento(jugador1, "tiene", puntaje1, "puntos.")
  cat("\n")
#STOP Esto es descriptivo, en teoria aquí hay un corte, al ser lineal todavia no sucede.
}


#ESTACION "3" Reporte de saldos
cat("\n")
cat("--------------------------------------------------\n")
titulo(paste("MARCADOR FINAL DE LA RONDA", ronda))

cat("Puntaje acumulado de ", jugador1, ":", puntaje1, "pts.\n")
cat("Puntaje acumulado de ", jugador2, ":", puntaje2, "pts.\n")

cat("--------------------------------------------------\n")
pausa(mensaje= "Presione")
#Fin estacion 3 
