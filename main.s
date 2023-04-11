; Definición de registros y constantes
; Suponemos que los semáforos y peatonales están representados por bits en registros de control de hardware

; Registros de control de semáforos
SEMAFORO0 equ 0x1000
SEMAFORO1 equ 0x1001
SEMAFORO2 equ 0x1002
SEMAFORO3 equ 0x1003

; Registros de control de peatonales
PEATONAL0 equ 0x2000
PEATONAL1 equ 0x2001
PEATONAL2 equ 0x2002
PEATONAL3 equ 0x2003

; Colores de semáforo
VERDE equ 0x01
AMARILLO equ 0x02
ROJO equ 0x00

; Definir una constante para representar el valor de espera en segundos
WAIT_TIME equ 25000000 ; 25 segundos (asumiendo 1 millón de ciclos de reloj por segundo)

; Subrutina para esperar un tiempo determinado
EsperarTiempo:
    MOV R1, #0 ; Inicializar contador en 0
    MOV R2, #0 ; Inicializar registro temporal en 0

    EsperarLoop:
        ADD R1, R1, #1 ; Incrementar contador en 1
        CMP R1, WAIT_TIME ; Comparar contador con valor de espera
        BNE EsperarLoop ; Saltar a EsperarLoop si el contador no ha alcanzado el valor de espera

    BX LR ; Retornar a la rutina llamadora



; Inicio del programa
main:
    loop:
        ; Llamar a la subrutina ConfigurarSemaforos
        BL ConfigurarSemaforos

        
        ; Esperar 25 segundos
        BL EsperarTiempo ; Llamar a la subrutina de espera de tiempo

        ; Llamar a la subrutina CambiarAmarillo0y2
        BL CambiarAmarillo0y2

        ; Esperar 25 segundos
        BL EsperarTiempo ; Llamar a la subrutina de espera de tiempo

        ; Llamar a la subrutina CambiarTodosSemaforos
        BL CambiarTodosSemaforos

        ; Esperar 25 segundos
        BL EsperarTiempo ; Llamar a la subrutina de espera de tiempo

        ; Llamar a la subrutina CambiarAmarillo1y3
        BL CambiarAmarillo1y3

        ; Esperar 25 segundos
        BL EsperarTiempo ; Llamar a la subrutina de espera de tiempo

        ; Actualizar registros y otros valores necesarios para la próxima iteración

        ; Salto incondicional al comienzo del loop (loop infinito)
        B loop
	

; Subrutina para cambiar semáforo 0 y 2 a amarillo
CambiarAmarillo0y2:
    ; Cambiar semáforo 0 a amarillo
    LDR R1, =SEMAFORO0 ; Cargar dirección de registro de control de semáforo 0
    MOV R2, #AMARILLO ; Configurar semáforo 0 en amarillo
    STR R2, [R1] ; Escribir valor en registro de control de semáforo 0

    ; Cambiar semáforo 2 a amarillo
    LDR R1, =SEMAFORO2 ; Cargar dirección de registro de control de semáforo 2
    MOV R2, #AMARILLO ; Configurar semáforo 2 en amarillo
    STR R2, [R1] ; Escribir valor en registro de control de semáforo 2

    BX LR ; Retornar de la subrutina


; Subrutina para cambiar semáforo 1 y 3 a amarillo
CambiarAmarillo1y3:
    ; Cambiar semáforo 1 a amarillo
    LDR R1, =SEMAFORO1 ; Cargar dirección de registro de control de semáforo 1
    MOV R2, #AMARILLO ; Configurar semáforo 1 en amarillo
    STR R2, [R1] ; Escribir valor en registro de control de semáforo 1

    ; Cambiar semáforo 3 a amarillo
    LDR R1, =SEMAFORO3 ; Cargar dirección de registro de control de semáforo 3
    MOV R2, #AMARILLO ; Configurar semáforo 3 en amarillo
    STR R2, [R1] ; Escribir valor en registro de control de semáforo 3

    BX LR ; Retornar de la subrutina


; Subrutina para configurar semáforos y peatonales iniciales
ConfigurarSemaforos:
    LDR R1, =SEMAFORO0 ; Cargar dirección de registro de control de semáforo 0
    MOV R2, #VERDE ; Configurar semáforo 0 en verde
    STR R2, [R1] ; Escribir valor en registro de control de semáforo 0

    LDR R1, =SEMAFORO1 ; Cargar dirección de registro de control de semáforo 1
    MOV R2, #ROJO ; Configurar semáforo 1 en rojo
    STR R2, [R1] ; Escribir valor en registro de control de semáforo 1

    LDR R1, =SEMAFORO2 ; Cargar dirección de registro de control de semáforo 2
    MOV R2, #VERDE ; Configurar semáforo 2 en verde
    STR R2, [R1] ; Escribir valor en registro de control de semáforo 2

    LDR R1, =SEMAFORO3 ; Cargar dirección de registro de control de semáforo 3
    MOV R2, #ROJO ; Configurar semáforo 3 en rojo
    STR R2, [R1] ; Escribir valor en registro de control de semáforo 3

    LDR R1, =PEATONAL0 ; Cargar dirección de registro de control de peatonal 0
    MOV R2, #ROJO ; Configurar peatonal 0 en rojo
    STR R2, [R1] ; Escribir valor en registro de control de peatonal 0

    LDR R1, =PEATONAL1 ; Cargar dirección de registro de control de peatonal 1
    MOV R2, #VERDE ; Configurar peatonal 1 en verde
    STR R2, [R1] ; Escribir valor en registro de control de peatonal 1

    LDR R1, =PEATONAL2 ; Cargar dirección de registro de control de peatonal 2
    MOV R2, #ROJO ; Configurar peatonal 2 en rojo
    STR R2, [R1] ; Escribir valor en registro de control de peatonal 2

    LDR R1, =PEATONAL3 ; Cargar dirección de registro de control de peatonal 3
    MOV R2, #ROJO ; Configurar peatonal 3 en rojo
    STR R2, [R1] ; Escribir valor en registro de control de peatonal 3

    ; Retornar de la subrutina
    BX LR


CambiarTodosSemaforos:
    ; Configurar semáforos y peatonales iniciales
    LDR R1, =SEMAFORO0 ; Cargar dirección de registro de control de semáforo 0
    MOV R2, #ROJO ; Configurar semáforo 0 en rojo
    STR R2, [R1] ; Escribir valor en registro de control de semáforo 0

    LDR R1, =SEMAFORO1 ; Cargar dirección de registro de control de semáforo 1
    MOV R2, #VERDE ; Configurar semáforo 1 en verde
    STR R2, [R1] ; Escribir valor en registro de control de semáforo 1

    LDR R1, =SEMAFORO2 ; Cargar dirección de registro de control de semáforo 2
    MOV R2, #ROJO ; Configurar semáforo 2 en rojo
    STR R2, [R1] ; Escribir valor en registro de control de semáforo 2

    LDR R1, =SEMAFORO3 ; Cargar dirección de registro de control de semáforo 3
    MOV R2, #VERDE ; Configurar semáforo 3 en verde
    STR R2, [R1] ; Escribir valor en registro de control de semáforo 3

    LDR R1, =PEATONAL0 ; Cargar dirección de registro de control de peatonal 0
    MOV R2, #VERDE ; Configurar peatonal 0 en verde
    STR R2, [R1] ; Escribir valor en registro de control de peatonal 0

    LDR R1, =PEATONAL1 ; Cargar dirección de registro de control de peatonal 1
    MOV R2, #ROJO ; Configurar peatonal 1 en rojo
    STR R2, [R1] ; Escribir valor en registro de control de peatonal 1

    LDR R1, =PEATONAL2 ; Cargar dirección de registro de control de peatonal 2
    MOV R2, #VERDE ; Configurar peatonal 2 en verde
    STR R2, [R1] ; Escribir valor en registro de control de peatonal 2

    LDR R1, =PEATONAL3 ; Cargar dirección de registro de control de peatonal 3
    MOV R2, #ROJO ; Configurar peatonal 3 en rojo
    STR R2, [R1] ; Escribir valor en registro de control de peatonal 3
	
	BX LR ; Retornar de la subrutina



; Subrutina para esperar 15 segundos
Esperar15Segundos:
    LDR R1, =TEMPORIZADOR ; Cargar dirección de registro de temporizador
    MOV R2, #0 ; Reiniciar el temporizador (ponerlo en 0)
    STR R2, [R1] ; Escribir valor en registro de temporizador

    MOV R3, #15000 ; Cargar el valor 15000 en R3 (15 segundos en milisegundos)
     
Esperar15Segundos_Loop:
    SUBS R3, R3, #1 ; Restar 1 a R3
    BNE Esperar15Segundos_Loop ; Saltar al loop si R3 no es igual a 0
    BX LR ; Retornar de la subrutina


; Subrutina para esperar 30 segundos
Esperar30Segundos:
    LDR R1, =TEMPORIZADOR ; Cargar dirección de registro de temporizador
    MOV R2, #0 ; Reiniciar el temporizador (ponerlo en 0)
    STR R2, [R1] ; Escribir valor en registro de temporizador

    MOV R3, #30000 ; Cargar el valor 30000 en R3 (30 segundos en milisegundos)

Esperar30Segundos_Loop:
    SUBS R3, R3, #1 ; Restar 1 a R3
    BNE Esperar30Segundos_Loop ; Saltar al loop si R3 no es igual a 0
    BX LR ; Retornar de la subrutina



END