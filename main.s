	
	AREA myData, DATA

;  COLORES DE SEMAFORO
ROJO EQU 0 
AMARILLO EQU 1
VERDE EQU 2
	
	
TIEMPO EQU 20
	
	
	AREA MYCODE, CODE
		ENTRY 
		EXPORT __main


__main


	LDR r0, =VERDE 		; Semaforo vehicular 0 (Oeste)
	LDR r1, =ROJO   	; Semaforo vehicular 1 (Sur)
	LDR r2, =VERDE 		; Semaforo vehicular 2 (Este)
	LDR r3, =ROJO   	; Semaforo vehicular 3 (Norte)
	
	LDR r4, =ROJO 		; Semaforo peatonal 0
	LDR r5, =VERDE   	; Semaforo peatonal 1
	LDR r6, =ROJO 		; Semaforo peatonal 2
	LDR r7, =VERDE   	; Semaforo peatonal 3
	
	LDR r8, =TIEMPO 	; Tiempo de referencia
	LDR r9, =0 			; Contador
	
	B loop
	
	
loop

	BL SentidoOesteEste
	
	BL EsperarTiempo 

	BL CambiarAmarillo0y2

	BL EsperarTiempo 

	BL SentidoNorteSur
	
	BL EsperarTiempo 

	BL CambiarAmarillo1y3

	BL EsperarTiempo

	B loop
	

CambiarAmarillo0y2

    MOV R0, #AMARILLO
    MOV R2, #AMARILLO
    BX LR

CambiarAmarillo1y3

    MOV R1, #AMARILLO 
    MOV R3, #AMARILLO
    BX LR

SentidoOesteEste
    MOV R0, #VERDE
    MOV R1, #ROJO 
    MOV R2, #VERDE 
    MOV R3, #ROJO
	
    MOV R4, #ROJO
    MOV R5, #VERDE 
    MOV R6, #ROJO
    MOV R7, #VERDE

    BX LR


SentidoNorteSur
    
	MOV R0, #ROJO 
    MOV R1, #VERDE
    MOV R2, #ROJO
    MOV R3, #VERDE
	
    MOV R4, #VERDE
    MOV R5, #ROJO
    MOV R6, #VERDE
    MOV R7, #ROJO
	
	BX LR


EsperarTiempo
	ADD r9,r9,#1; Contador += 1
	SUBS r10, r8, r9 
	
	; if Contador != Tiempo
	BNE EsperarTiempo 
	
	; Else
	MOV r9, #0
	BX LR

	END
	
	