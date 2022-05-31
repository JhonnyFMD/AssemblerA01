;____________________________________________________________
; asm-mul.asm
; Imprime la multiplicacion de dos numeros
; T00058321 Jhonny Frank Mendivil Diaz
;____________________________________________________________
.model small
.stack 

.data ;variables
	numero1 db 0
	numero2 db 0
	multiplicacion db 0
	ingresar db 13,10 ,'Ingrese un numero: $'
	resultado db 13,10 , 'La multiplicacion es: $' 
.code
	main PROC ;funcion main

        ; carga en memoria las variables del segmento de datos
    	MOV ax, @data
    	MOV ds, ax  
		
		;pedir datos para el numero1
		mov ah, 09h
		lea dx, ingresar
		int 21h
		mov ah, 01h
		int 21h
		sub al, 30h
		mov numero1, al
		
		;pedir datos para el numero2
		mov ah, 09h
		lea dx, ingresar
		int 21h
		mov ah, 01h
		int 21h
		sub al, 30h
		mov numero2, al
		
		;hacer la multiplicacion
		mov al, numero1
		mul numero2
		mov multiplicacion, al
		
		;imprimir el resultado
		mov ah, 09h
		lea dx, resultado
		int 21h
		mov dl, multiplicacion
		add dl, 30h
		mov ah, 02h
		int 21h
  
    	.exit ;FIN
	main ENDP   
end main