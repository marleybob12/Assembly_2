.data
msg1:  .asciiz "Digite a nota (0 a 10): "
msgM:  .asciiz "Media = "
msgA:  .asciiz "\nAPROVADO"
msgE:  .asciiz "\nEXAME"
msgR:  .asciiz "\nRETIDO"

.text
.globl main
main:
    li $t0, 0       # $t0 = somador das notas
    li $t1, 4       # $t1 = contador (4 notas)

laco_notas:
    li $v0, 4
    la $a0, msg1
    syscall
    
    li $v0, 5
    syscall
    add $t0, $t0, $v0   # soma += nota
    
    subi $t1, $t1, 1
    bnez $t1, laco_notas

    # Calcula a media inteira para exibir (soma / 4)
    sra $t2, $t0, 2     # $t2 = $t0 / 4

    # Exibe a media
    li $v0, 4
    la $a0, msgM
    syscall
    li $v0, 1
    move $a0, $t2
    syscall

    # Verifica as condicoes baseadas na SOMA total
    li $t3, 24
    bge $t0, $t3, aprovado
    
    li $t3, 12
    bge $t0, $t3, exame
    
    j retido

aprovado:
    li $v0, 4
    la $a0, msgA
    syscall
    j fim

exame:
    li $v0, 4
    la $a0, msgE
    syscall
    j fim

retido:
    li $v0, 4
    la $a0, msgR
    syscall

fim:
    li $v0, 10
    syscall
