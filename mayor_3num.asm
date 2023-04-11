.data
prompt1: .asciiz "Ingrese el primer número: "
prompt2: .asciiz "Ingrese el segundo número: "
prompt3: .asciiz "Ingrese el tercer número: "
output: .asciiz "El número mayor es: "

.text
.globl main

main:
# mostrar los mensajes de solicitud de entrada
li $v0, 4
la $a0, prompt1
syscall

# leer el primer número desde la entrada del usuario
li $v0, 5
syscall
move $t0, $v0

# mostrar el segundo mensaje de solicitud de entrada
li $v0, 4
la $a0, prompt2
syscall

# leer el segundo número desde la entrada del usuario
li $v0, 5
syscall
move $t1, $v0

# mostrar el tercer mensaje de solicitud de entrada
li $v0, 4
la $a0, prompt3
syscall

# leer el tercer número desde la entrada del usuario
li $v0, 5
syscall
move $t2, $v0

# comparar los números para encontrar el menor
move $t3, $t0
blt $t1, $t3, L1
move $t3, $t1
L1:
blt $t2, $t3, L2
move $t3, $t2
L2:

# mostrar el número menor
li $v0, 4
la $a0, output
syscall
li $v0, 1
move $a0, $t3
syscall

# salir del programa
li $v0, 10
syscall
