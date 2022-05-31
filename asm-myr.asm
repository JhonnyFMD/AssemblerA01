;____________________________________________________________
; asm-myr.asm
; Imprime el mayor de dos numeros
; T00058321 Jhonny Frank Mendivil Diaz
;____________________________________________________________
.model small
.stack 

.data ;variables
	numero1 db 0
	numero2 db 0
	mayor db 0
	ingresar db 13,10 ,'Ingrese un numero: $'
	resultado db 13,10 , 'El mayor es: $' 
.code
	main PROC ;funcion main

        ; carga en memoria las variables del segmento de datos
    	MOV ax, @data
    	MOV ds, ax  
		
		;PEDIR NUMERO #1
		;ingresar el numero
		mov ah, 09h
		lea dx, ingresar
		int 21h
		;almacenar el numero en [numero1]
		mov ah, 01h
		int 21h
		sub al, 30h
		mov numero1, al
		
		;PEDIR NUMERO #2
		;ingresar el numero
		mov ah, 09h
		lea dx, ingresar
		int 21h
		;almacenar el numero en [numero2]
		mov ah, 01h
		int 21h
		sub al, 30h
		mov numero2, al
	
		;obtener el mayor
		mov al, numero1
		cmp al, numero2 ;comparacion de los numeros (con una resta)
		jg n1mayor ;si el resultado es positivo
		jmp n2mayor ;caso contrario
		n1mayor:
			mov ah, numero1
			mov mayor, ah
			jmp imprimirResultado
		n2mayor:
			mov ah, numero2
			mov mayor, ah
			jmp imprimirResultado
			
		;imprimir el resultado
		imprimirResultado:
			mov ah, 09h
			lea dx, resultado
			int 21h
			mov dl, mayor
			add dl, 30h
			mov ah, 02h
			int 21h
		.exit ;FIN
	main ENDP   
end main