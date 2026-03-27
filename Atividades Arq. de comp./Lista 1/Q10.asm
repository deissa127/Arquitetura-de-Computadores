# 10. Faça um programa que leia um caractere minúsculo e imprima o seu equivalente
#     maiúsculo.

.text
main:  addi $2, $0, 5
       syscall
       add $8, $0, $2 #a
       addi $2, $0, 5
       syscall
       add $9, $0, $2 #b
       
       sub $10, $8, $9 # $10 = $8 - $9
       not $11, $10    # $11 = $10'
       
       srl $20, $10, 31 #ss
       srl $21, $11, 31 #ss'
       
       mul $15, $8, $20 #a * ss
       mul $16, $9, $21 #b * ss'
       
       add $4, $15, $16 # imp = a * ss + b * ss'
       
       addi $2, $0, 1  #serviço de impressao (1)
       syscall         # imp ($4)
       
       addi $2, $0, 10
       syscall