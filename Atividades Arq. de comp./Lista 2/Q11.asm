# 11. Um pico em uma onda mecânica é caracterizado por três valores de magnitude , a, b e
#     c, tais que (a<b e b>c) forma um pico positivo ou (a>b e b<c) forma um pico negativo.
#     Faça um programa que leia 3 números e indique se formam um pico, imprimindo a
#     letra P, caso formem. Além disso o código deve informar se o pico é positivo negativo,
#     acrescentando um sinal de + ou de – após a letra P. Se os três pontos não formarem
#     um pico, deve ser impressa a letra N.


.text
main:	addi $2, $0, 5	# A
	syscall
	add $8, $0, $2
	
	addi $2, $0, 5	# B
	syscall
	add $9, $0, $2
	
	addi $2, $0, 5	# C
	syscall
	add $10, $0, $2
	
	# é um pico? (b > a e c) ou (b < a e c)
	
	slt $11, $9, $8  # $a > $b = $x -> 0 // $a < $b = $x -> 1
	slt $12, $9, $10  # $a > $b = $x -> 0 // $a < $b = $x -> 1
	beq $11, $12, épico 
	
npico:
	add $4, $0, 'N'
	addi $2,$0, 11
	syscall
	
	j fim
	
épico:
	add $4, $0, 'P'
	addi $2,$0, 11
	syscall
	
	# positivo (a=0 e c=0) ou negativo (a=1 e c=1)?
	
	beq $11, $0, mais
	
menos:
	add $4, $0, '-'
	addi $2,$0, 11
	syscall
	
	j fim
	
mais:	
	add $4, $0, '+'
	addi $2,$0, 11
	syscall
	
fim:	addi $2, $0, 10
	syscall
	