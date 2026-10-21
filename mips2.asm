.data
ms1: "o valor da circuferencia é = "
ms2 : "considerando pi como 3"
.text

main :
#raio
   li $t0,8
#pi 
   li $t1,3
 #formula
 
   mul $t2,$t1,$t0
   mul $t2,2,$t2
   #mensagem
   
   li $v0 ,4
   la $a0,ms2
   la $a1,ms1
   syscall
   
   
      
  li $v0 ,1
  add  $a0 ,$t2,0
  syscall   
   
 