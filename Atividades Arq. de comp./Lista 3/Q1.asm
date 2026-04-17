# 1. Faça um programa que calcule e mostre os 10 primeiros números múltiplos de 3,
#    considerando valores maiores que 0.

.text
main: 
      addi $8, $0, 1
      addi $9, $0, 3
      addi $10, $0, 11

teste: beq $8, $10, fim
#----------CORPO DO LAÇO--------------
       mul $4, $8, $9
       addi $2, $0, 1
       syscall
       
       add $4, $0, ' '
       addi $2, $0, 11
       syscall
         

#-------FIM DO CORPO DO LAÇO--------------      
prox:  addi $8, $8, 1 # i++
       j teste        
fim:    
       addi $2, $0, 10
       syscall