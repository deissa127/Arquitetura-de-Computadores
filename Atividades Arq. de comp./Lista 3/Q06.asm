# 6. Faça um programa que leia números inteiros e calcule a soma. O laço do programa
#    termina quando o usuário digita um valor negativo. Em seguida o programa imprime a
#    soma dos valores digitados.

.text
main:

#----------CORPO DO LAÇO--------------
	add $2, $0, 5
	syscall
	add $8, $0, $2

teste:	slt $9, $8, $0	# $a > $b = $x -> 0 // $a < $b = $x -> 1
	bne $9, $0, fim
	add $18, $18, $8    # maior que zero, soma
#-------FIM DO CORPO DO LAÇO--------------      
prox:	j main
	
fim:	add $4, $0, $18
	add $2, $0, 1
	syscall
	
	add $2, $0, 10
	syscall