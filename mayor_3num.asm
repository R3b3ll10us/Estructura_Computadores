.data
prompt1: .asciiz "Ingrese el primer n�mero: "
prompt2: .asciiz "Ingrese el segundo n�mero: "
prompt3: .asciiz "Ingrese el tercer n�mero: "
output: .asciiz "El n�mero mayor es: "

.text
.globl main

main:
# mostrar los mensajes de solicitud de entrada
li $v0, 4
la $a0, prompt1
syscall

# leer el primer n�mero desde la entrada del usuario
li $v0, 5
syscall
move $t0, $v0

# mostrar el segundo mensaje de solicitud de entrada
li $v0, 4
la $a0, prompt2
syscall

# leer el segundo n�mero desde la entrada del usuario
li $v0, 5
syscall
move $t1, $v0

# mostrar el tercer mensaje de solicitud de entrada
li $v0, 4
la $a0, prompt3
syscall

# leer el tercer n�mero desde la entrada del usuario
li $v0, 5
syscall
move $t2, $v0

# comparar los n�meros para encontrar el menor
move $t3, $t0
blt $t1, $t3, L1
move $t3, $t1
L1:
blt $t2, $t3, L2
move $t3, $t2
L2:

# mostrar el n�mero menor
li $v0, 4
la $a0, output
syscall
li $v0, 1
move $a0, $t3
syscall

# salir del programa
li $v0, 10
syscall
