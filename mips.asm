.data
msg1: .asciiz "Digite um numero inteiro: "
msg2: .asciiz "A diferenca e = "

.text
.globl main
main:
    # 1. Ler o primeiro numero
    li $v0, 4
    la $a0, msg1
    syscall
    li $v0, 5
    syscall
    move $t0, $v0
    
    # 2. Ler o segundo numero
    li $v0, 4
    la $a0, msg1
    syscall
    li $v0, 5
    syscall
    move $t1, $v0

    # 3. Logica simples com bge
    sub $t2, $t0, $t1       # Assume que $t0 - $t1
    bge $t0, $t1, positivo  # Se $t0 >= $t1, pula direto para o fim (ja esta correto)
    
    sub $t2, $t1, $t0       # Se nao, corrige fazendo $t1 - $t0

positivo:
    # 4. Exibir a mensagem do resultado
    li $v0, 4
    la $a0, msg2
    syscall
    
    # 5. Exibir o valor da diferenca
    li $v0, 1
    move $a0, $t2
    syscall
    
    # 6. Encerrar o programa
    li $v0, 10
    syscall
