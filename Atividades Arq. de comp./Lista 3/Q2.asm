# 2. Faça um programa que solicite ao usuário um número para ser a referência e outro
#    para ser a quantidade de valores a ser impresso no caso do programa da Q1. Para a
#    mesma resposta, por exemplo, o usuário forneceria a referência 3 e a quantidade 10.

.text
main: 
	add $2, $0, 5
	syscall
	add $9, $0, $2
	
	add $2, $0, 5
	syscall
	add $10, $0, $2
	addi $10, $10, 1
	
	addi $8, $0, 1

teste:  beq $8, $10, fim
#----------CORPO DO LAÇO--------------
        mul $4, $8, $9
        addi $2, $0, 1
        syscall
       
        add $4, $0, ' '
        addi $2, $0, 11
        syscall
         

#-------FIM DO CORPO DO LAÇO--------------      
prox:   addi $8, $8, 1 # i++
        j teste        
fim:    
        addi $2, $0, 10
        syscall