# 8. Faça um programa que leia dia, mês e ano e informe se a data é válida.
# 1º - precisa saber se o ano é bissexto ou não;
# 2º - quantidade de meses;
# 3º - dias do mês digitado;
.text
main:	addi $2, $0, 5
	syscall
	add $8, $0, $2
	
