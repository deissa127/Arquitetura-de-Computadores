# 7. Faça um programa que leia números inteiros diferentes de zero e calcule a soma dos
#    valores positivos. O laço do programa termina quando o usuário digita um valor zero.
#    Em seguida o programa imprime a soma dos valores positivos digitados.

.text
main:
	addi $10, $0, 1
#----------CORPO DO LAÇO--------------
laco:	
    add $2, $0, 5
	syscall
	add $8, $0, $2

teste:	
    slt $9, $8, $10	    # $a > $b = $x -> 0 // $a < $b = $x -> 1
	bne $9, $0, fim     # se menor que 1, vai pro fim
	add $18, $18, $8
#-------FIM DO CORPO DO LAÇO--------------      
prox:	
    j laco 
	
fim:	
    add $4, $0, $18
	add $2, $0, 1
	syscall
	
	add $2, $0, 10
	syscall