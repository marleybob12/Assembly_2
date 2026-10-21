.data
escreva01: .asciiz "o volume do paralelepido é = "

.text


main:
#valores do paralelpipedo
   li $t0,1
   li $t1,7
   li $t2,5
   mul $t3,$t1,$t0
   mul $t3,$t2,$t3
   li $v0 ,4
   la $a0,escreva01
   syscall
   
      
  li $v0 ,1
  add  $a0 ,$t3,0
  syscall   