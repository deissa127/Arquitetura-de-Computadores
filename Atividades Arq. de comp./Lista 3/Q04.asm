# 4. Faça um programa que leia do usuário um intervalo fechado e imprima os números
#    pares desse intervalo (inclusive os limites).

.text
main: addi $2, $0, 5
      syscall
      add $8, $0, $2
     
      addi $2, $0, 5
      syscall
      addi $9, $2, 1
     
teste: beq $8, $9, fim
#----------CORPO DO LAÇO--------------
       andi $10, $8, 1  # termina com 0 = par, termina com 1 = impar
       bne $10, $0, prox    # se não for par vai pra prox
       add $4, $0, $8
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