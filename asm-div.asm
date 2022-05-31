;____________________________________________________________
; asm-div.asm
; Imprime la division de dos numeros
; T00058321 Jhonny Frank Mendivil Diaz
;____________________________________________________________
.model small
.stack 

.data ;variables
	numero1 db 0
	numero2 db 0
	division db 0
	ingresar db 13,10 ,'Ingrese un numero: $'
	resultado db 13,10 , 'La division es: $' 
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
		
		;hacer la division
		xor ax,ax
		mov al, numero1
		div numero2
		mov division, al
		
		;imprimir el resultado
		mov ah, 09h
		lea dx, resultado
		int 21h
		mov dl, division
		add dl, 30h
		mov ah, 02h
		int 21h
  
    	.exit ;FIN
	main ENDP   
end main