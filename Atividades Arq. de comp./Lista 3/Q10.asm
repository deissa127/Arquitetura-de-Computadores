# 10. Faça um programa para calcular o MDC de dois números fornecidos pelo usuário,
#     usando o algoritmo de Euclides (busque na Internet o funcionamento desse
#     algoritmo).

# Como funciona (Passo a Passo):
# Divida o número maior pelo menor.
# Anote o resto da divisão.
# Substitua o número maior pelo menor e o menor pelo resto obtido.
# Repita o processo até que o resto seja zero.
# O MDC é o último resto não nulo.

.text
main:
	addi $2, $0, 5
	syscall
	add $8, $0, $2
	
	addi $2, $0, 5
	syscall
	add $9, $0, $2
	
	# coloca o maior em $8
	slt $25, $8, $9         # $25 = 1 se $8 < $9
	beq $25, $0, laco       # $8 já é maior ou igual, inicia o laço

	# Troca: $8 <-> $9
	add $10, $0, $8
	add $8,  $0, $9
	add $9,  $0, $10

#----------CORPO DO LAÇO--------------
laco:
	div $8, $9              # $8 / $9
	mfhi $24                # $24 = resto

	beq $24, $0, saida$9	# Resto 0: MDC é $9

	add $8, $0, $9          # a = b
	add $9, $0, $24         # b = resto

	j laco
	
saida:
	add $4, $0, $24
	addi $v0, $0, 1
	syscall
	
	j fim
	
saida$9:
	add $4, $0, $9
	addi $v0, $0, 1
	syscall

fim:
	addi $v0, $0, 10
	syscall