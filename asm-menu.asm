;____________________________________________________________
; asm-menu.asm
; Menu con opciones de suma, resta, multiplicacion, division, promedio
; T00058321 Jhonny Frank Mendivil Diaz
;____________________________________________________________
.model small
.stack 

.data ;variables
	msgSeguir db 13,10,'Seguir...[Enter]$'
	msgExit db 13,10 ,'__________________',13,10 ,13,10 ,' FIN DEL PROGRAMA ',13,10 ,'__________________','$'
	msgInvalid db 13,10 ,'__________________',13,10 ,13,10 ,' Opcion Invalida... ',13,10 ,'__________________','$'
	msgMenu db 13,10 ,'______________[ Menu ]_______________',13,10 ,' ',13,10 ,'1. Sumar 2 numeros.',13,10 ,'2. Restar 2 numeros.',13,10 ,'3. Multiplicar 2 numeros.',13,10 ,'4. Dividir 2 numeros.',13,10 ,'5. Calcular promedio de 10 datos.',13,10 ,'0. Salir.',13,10 ,'_____________________________________','$'
	msgOpcion db 13,10 ,'Opcion: $';
	msgResultado db 13,10 , 'El resultado es: $';
	msgIngresar db 13,10 ,'Ingrese un numero: $'
	opcion db 0
	numeroi db 0
	numero1 db 0
	numero2 db 0
	dividendo db 0
	acumulador db 0
	resultado db 0
.code
	main PROC ;funcion main

        ; carga en memoria las variables del segmento de datos
    	MOV ax, @data
    	MOV ds, ax  
		
		;FUNCION MENU
		menu:
			;Imprimir el mensaje de menu
			lea dx, offset msgMenu
			mov ah, 09h
			int 21h
			;Pedir opcion 
			;Ingresar la opcion
			mov ah, 09h
			lea dx, msgOpcion
			int 21h
			;Almacenar la opcion en [opcion]
			mov ah, 01h
			int 21h
			sub al, 30h
			mov opcion, al
			;Si la opcion es 1, ir a la FUNCION SUMA
			cmp al, 1
			je suma
			;Si la opcion es 2, ir a la FUNCION RESTA
			cmp al, 2
			je resta
			;Si la opcion es 3, ir a la FUNCION MULTIPLICAR
			cmp al, 3
			je multiplicar
			;Si la opcion es 4, ir a la FUNCION DIVIDIR
			cmp al, 4
			je dividir
			;Si la opcion es 5, ir a la FUNCION PROMEDIO
			cmp al, 5
			je promedio
			;Si la opcion es 0, ir a la FUNCION EXIT
			cmp al, 0
			je exit
			;en caso contrario, ir a la FUNCION INVALID
			jmp invalid
		
		;FUNCION SEGUIRMENU
		seguirMenu:
			mov ah, 09h
			lea dx, msgSeguir
			int 21h
			mov ah, 1
			int 21h
			sub al, 30h
			;volver al menu
			jmp menu
		
		;FUNCION INVALID
		invalid:
			;Imprimir el mensaje de invalid
			lea dx, offset msgInvalid
			mov ah, 09h
			int 21h
			;Regresarlo al menu
			jmp menu
		
		;FUNCION SUMA
		suma:
			;pedir datos para el numero1
			mov ah, 09h
			lea dx, msgIngresar
			int 21h
			mov ah, 1
			int 21h
			sub al, 30h
			mov numero1, al
			;pedir datos para el numero2
			mov ah, 09h
			lea dx, msgIngresar
			int 21h
			mov ah, 01h
			int 21h
			sub al, 30h
			mov numero2, al
			;hacer la suma
			mov al, numero1
			add al, numero2
			mov resultado, al
			;imprimir el resultado
			mov ah, 09h
			lea dx, msgResultado
			int 21h
			mov dl, resultado
			add dl, 30h
			mov ah, 02h
			int 21h
			;llamar a la FUNCION SEGUIRMENU
			jmp seguirMenu
			
		;FUNCION RESTA
		resta:
			;pedir datos para el numero1
			mov ah, 09h
			lea dx, msgIngresar
			int 21h
			mov ah, 1
			int 21h
			sub al, 30h
			mov numero1, al
			;pedir datos para el numero2
			mov ah, 09h
			lea dx, msgIngresar
			int 21h
			mov ah, 01h
			int 21h
			sub al, 30h
			mov numero2, al
			;hacer la resta
			mov al, numero1
			sub al, numero2
			mov resultado, al
			;imprimir el resultado
			mov ah, 09h
			lea dx, msgResultado
			int 21h
			mov dl, resultado
			add dl, 30h
			mov ah, 02h
			int 21h
			;llamar a la FUNCION SEGUIRMENU
			jmp seguirMenu
			
		;FUNCION MULTIPLICAR
		multiplicar:
			;pedir datos para el numero1
			mov ah, 09h
			lea dx, msgIngresar
			int 21h
			mov ah, 1
			int 21h
			sub al, 30h
			mov numero1, al
			;pedir datos para el numero2
			mov ah, 09h
			lea dx, msgIngresar
			int 21h
			mov ah, 01h
			int 21h
			sub al, 30h
			mov numero2, al
			;hacer la multiplicacion
			mov al, numero1
			mul numero2
			mov resultado, al
			;imprimir el resultado
			mov ah, 09h
			lea dx, msgResultado
			int 21h
			mov dl, resultado
			add dl, 30h
			mov ah, 02h
			int 21h
			;llamar a la FUNCION SEGUIRMENU
			jmp seguirMenu
			
		;FUNCION DIVIDIR
		dividir:
			;pedir datos para el numero1
			mov ah, 09h
			lea dx, msgIngresar
			int 21h
			mov ah, 1
			int 21h
			sub al, 30h
			mov numero1, al
			;pedir datos para el numero2
			mov ah, 09h
			lea dx, msgIngresar
			int 21h
			mov ah, 01h
			int 21h
			sub al, 30h
			mov numero2, al
			;hacer la division
			xor ax,ax
			mov al, numero1
			div numero2
			mov resultado, al
			;imprimir el resultado
			mov ah, 09h
			lea dx, msgResultado
			int 21h
			mov dl, resultado
			add dl, 30h
			mov ah, 02h
			int 21h
			;llamar a la FUNCION SEGUIRMENU
			jmp seguirMenu
			
		;FUNCION PROMEDIO
		promedio:
			mov cx, 10;establecer tamaño del ciclo
			mov al, 0;reiniciar las variables acumuladoras/contadoras a su valor inicial (0)
			mov numeroi, al
			mov dividendo, al
			mov acumulador, al
			pedirDato:  ;pedir los datos
				;ingresar el numero
				mov ah, 09h
				lea dx, msgIngresar
				int 21h
				;almacenar el numero en [numero]
				mov ah, 01h
				int 21h
				sub al, 30h
				mov numeroi, al
				;acumular el numero en [acumulador]
				mov al, acumulador
				add al, numeroi
				mov acumulador, al
				;aumentar el dividendo
				inc dividendo
				;siguiente iteracion
				loop pedirDato
				
			;dividir [acumulador] entre [dividendo] para obtener el promedio [resultado]
			xor ax,ax
			mov al, acumulador
			div dividendo
			mov resultado, al
			;imprimir el resultado
			mov ah, 09h
			lea dx, msgResultado
			int 21h
			mov dl, resultado
			add dl, 30h
			mov ah, 02h
			int 21h
			;llamar a la FUNCION SEGUIRMENU
			jmp seguirMenu
		
		;FUNCION EXIT
		exit:
			;Imprimir el mensaje de exit
			lea dx, offset msgExit
			mov ah, 09h
			int 21h
  
    	.exit ;FIN
	main ENDP   
end main