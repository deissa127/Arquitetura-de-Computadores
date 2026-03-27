# 4. Faça um programa para ler duas notas de um aluno do IFRN em um curso semestral.
#    Esse programa deverá apresentar a média desse aluno, após as duas provas.

.text
main: 	addi $2,$0,5
	syscall
	add $8,$0,$2
	
	addi $2,$0,5
	syscall
	
	add $9,$8,$2
	
	addi $10,$0,2
	
	div $9,$10
	mflo $4
	
	addi $2,$0,1
	syscall

	addi $2, $0, 10
	syscall
