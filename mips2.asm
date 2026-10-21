.data
ms1: .asciiz "o valor da circuferencia é = "
ms2: .asciiz "considerando pi como 3\n"  # Adicionado \n para quebrar a linha

.text
main:
    # raio
    li $t0, 8
    
    # pi 
    li $t1, 3
  
    # formula: 2 * pi * raio
    mul $t2, $t1, $t0     # $t2 = 3 * 8 = 24
    mul $t2, $t2, 2       # $t2 = 24 * 2 = 48
    
    # 1º Print: Imprime "considerando pi como 3" e pula uma linha
    li $v0, 4
    la $a0, ms2
    syscall
    
    # 2º Print: Imprime "o valor da circuferencia é = "
    li $v0, 4
    la $a0, ms1
    syscall
    
    # 3º Print: Imprime o valor numérico (48) logo após ms1
    li $v0, 1
    move $a0, $t2         # (ou add $a0, $t2, 0)
    syscall
    
    # Encerrar o programa corretamente (evita o "dropped off bottom")
    li $v0, 10
    syscall