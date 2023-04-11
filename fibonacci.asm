.data
prompt: .asciiz "Ingrese un n�mero: "
result: .asciiz "La serie de Fibonacci es: "

.text
.globl main

main:
    # Prompt para ingresar un n�mero
    li $v0, 4
    la $a0, prompt
    syscall
    
    # Leer el n�mero
    li $v0, 5
    syscall
    move $t0, $v0
    
    # Inicializar los primeros dos n�meros de la serie
    li $t1, 0 # Primer n�mero de Fibonacci
    li $t2, 1 # Segundo n�mero de Fibonacci
    
    # Imprimir el primer n�mero de la serie
    li $v0, 1
    move $a0, $t1
    syscall
    
    # Imprimir el segundo n�mero de la serie
    li $v0, 4
    la $a0, result
    syscall
    li $v0, 1
    move $a0, $t2
    syscall
    
    # Calcular y imprimir la serie de Fibonacci
    addi $t3, $0, 2 # Contador
    loop:
        add $t3, $t3, 1 # Incrementar el contador
        add $t4, $t1, $t2 # Sumar los dos n�meros anteriores de Fibonacci
        li $v0, 4 # Imprimir una coma y un espacio
        la $a0, result
        syscall
        li $v0, 1 # Imprimir el n�mero actual de Fibonacci
        move $a0, $t4
        syscall
        move $t1, $t2 # Actualizar el primer n�mero anterior
        move $t2, $t4 # Actualizar el segundo n�mero anterior
        blt $t3, $t0, loop # Repetir hasta que se hayan impreso n n�meros de Fibonacci
    
    # Salir del programa
    li $v0, 10
    syscall