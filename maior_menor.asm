.data
msg1:   .asciiz "Digite um numero positivo: "
msgErr: .asciiz "Valor invalido! Apenas numeros positivos.\n"
msgMax: .asciiz "Maior valor = "
msgMin: .asciiz "\nMenor valor = "

.text
.globl main
main:
    li $t0, 0       # contador de numeros validos aceitos = 0
    li $t1, 10      # limite de numeros validos = 10

laco_10:
    beq $t0, $t1, fim_programa
    
    li $v0, 4
    la $a0, msg1
    syscall
    
    li $v0, 5
    syscall
    move $t2, $v0   # valor lido

    # Validar se e positivo (> 0)
    blez $t2, invalido

    # Se for o primeiro numero valido, inicializa max e min com ele
    bnez $t0, verifica_limites
    move $t3, $t2   # $t3 = maior
    move $t4, $t2   # $t4 = menor
    j numero_aceito

verifica_limites:
    # Atualiza maior se $t2 > $t3
    ble  $t2, $t3, nao_maior
    move $t3, $t2
nao_maior:

    # Atualiza menor se $t2 < $t4
    bge  $t2, $t4, nao_menor
    move $t4, $t2
nao_menor:

numero_aceito:
    addi $t0, $t0, 1   # incrementa apenas se o numero for valido
    j    laco_10

invalido:
    li $v0, 4
    la $a0, msgErr
    syscall
    j    laco_10        # repete a leitura pedindo o mesmo indice

fim_programa:
    # Exibir maior
    li $v0, 4
    la $a0, msgMax
    syscall
    li $v0, 1
    move $a0, $t3
    syscall
    
    # Exibir menor
    li $v0, 4
    la $a0, msgMin
    syscall
    li $v0, 1
    move $a0, $t4
    syscall

    li $v0, 10
    syscall
