# 3. Faça um programa que implementa um laço com um teste no início que conte de 0 a
#    10 imprimindo esses números, um em cada linha da saída.
.text
main: 
       addi $8, $0, 0
       addi $10, $0, 11

teste:  beq $8, $10, fim
#----------CORPO DO LAÇO--------------
        add $4, $0, $8
        addi $2, $0, 1
        syscall
       
	add $4, $0, '\n'
        addi $2, $0, 11
        syscall
         

#-------FIM DO CORPO DO LAÇO--------------      
prox:   addi $8, $8, 1 # i++
        j teste        
fim:    
        addi $2, $0, 10
        syscall