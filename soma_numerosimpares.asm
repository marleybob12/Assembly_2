.data
msg1:   .asciiz "Digite um numero inteiro: "
msgRes: .asciiz "Somatoria dos impares = "

.text
.globl main
main:
    # Ler primeiro numero
    li $v0, 4
    la $a0, msg1
    syscall
    li $v0, 5
    syscall
    move $t0, $v0
    
    # Ler segundo numero
    li $v0, 4
    la $a0, msg1
    syscall
    li $v0, 5
    syscall
    move $t1, $v0

    # Descobrir menor ($t2) e maior ($t3)
    move $t2, $t0       # assume que num1 e o menor
    move $t3, $t1       # assume que num2 e o maior
    ble  $t0, $t1, ordem_ok
    move $t2, $t1       # se num2 for menor, ajusta
    move $t3, $t0       # se num1 for maior, ajusta
ordem_ok:

    # Preparar loop entre (menor + 1) e (maior - 1)
    addi $t4, $t2, 1    # $t4 = inicio do loop (menor + 1)
    li   $t5, 0         # $t5 = acumulador da soma

laco_impar:
    bge  $t4, $t3, fim_laco  # Se $t4 >= maior, encerra o loop

    # Verifica se o numero e impar (numero & 1 != 0)
    andi $t6, $t4, 1
    beqz $t6, nao_impar
    add  $t5, $t5, $t4       # soma += numero impar

nao_impar:
    addi $t4, $t4, 1         # proximo numero
    j    laco_impar

fim_laco:
    # Exibir resultado
    li $v0, 4
    la $a0, msgRes
    syscall
    
    li $v0, 1
    move $a0, $t5
    syscall

    li $v0, 10
    syscall
