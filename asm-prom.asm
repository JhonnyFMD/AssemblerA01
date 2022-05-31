;____________________________________________________________
; asm-prom.asm
; Imprime el promedio de diez numeros
; T00058321 Jhonny Frank Mendivil Diaz
;____________________________________________________________
.model small
.stack 

.data ;variables
	numero db 0
	acumularSuma db 0
	dividendo db 0
	promedio db 0
	ingresar db 13,10 ,'Ingrese un numero: $'
	resultado db 13,10 , 'El promedio es: $' 
.code
	main PROC ;funcion main

        ; carga en memoria las variables del segmento de datos
    	MOV ax, @data
    	MOV ds, ax  
		
		mov cx, 10;establecer tamaño del ciclo
		pedirDato:  ;pedir los datos
			;ingresar el numero
			mov ah, 09h
			lea dx, ingresar
			int 21h
			;almacenar el numero en [numero]
			mov ah, 01h
			int 21h
			sub al, 30h
			mov numero, al
			;acumular el numero en [acumularSuma]
			mov al, acumularSuma
			add al, numero
			mov acumularSuma, al
			;aumentar el dividendo
			inc dividendo
			;siguiente iteracion
			loop pedirDato
			
		;dividir [acumularSuma] entre [dividendo] para obtener el [promedio]
		xor ax,ax
		mov al, acumularSuma
		div dividendo
		mov promedio, al
		
		;imprimir el resultado
		mov ah, 09h
		lea dx, resultado
		int 21h
		mov dl, promedio
		add dl, 30h
		mov ah, 02h
		int 21h
  
    	.exit ;FIN
	main ENDP   
end main