.text
main:
	lui $8, 0x1001
	lui $6, 0x1001
	
	lui $5, 0x1001
	addi $5, $5, 124
	
	lui $9, 0x00ff
	
	addi $10, $0, 32
	addi $12, $0, 0
	
	addi $7, $8, 1920
	addi $11, $0, 480
	
linha1:
	beq $10, $0, linha2
	sw $9, 0($8)
	addi $8, $8, 4
	addi $10, $10 -1
	j linha1
	
linha2:
	beq $11, 512, coluna1
	sw $9, 0($7)
	addi $7, $7, 4
	addi $11, $11 1
	j linha2
	
coluna1:
	beq $15, 16, coluna2
	sw $9, 0($6)
	addi $6, $6, 128
	addi $15, $15, 1
	j coluna1



coluna2:
	beq $13, 16, fim
	sw $9, 0($5)
	addi $5, $5, 128
	addi $13, $13, 1
	j coluna2
	
fim:	
	addi $2, $0, 10
	syscall







# o picel 32256
# total de pixels = 8192
# linha = 128
# coluna = 64



.text
main:
	lui $8, 0x1001
	lui $7, 0x1001
	addi $7, $7, 32256
	lui $6, 0x1001
	lui $5, 0x1001
	
	li $9, 0xfa5a9a
	
	addi $10, $0, 128
	addi $11, $0, 8064
	addi $12, $0, 0

linha:
	beq $10, $0, linha2
	sw $9, 0($8)
	addi $8, $8, 4
	addi $10, $10, -1	
	j linha
	
linha2:
	beq $11, 8192, colunas
	sw $9, 0($7)
	addi $7, $7, 4
	addi $11, $11, 1	
	j linha2
	
colunas:
	beq $12, 32256, parede
	sw $9, 0($6)
	addi $6, $6, 508
	addi $12, $12, 508
	sw $9, 0($6)
	addi $6, $6, 4
	addi $12, $12, 4
	j colunas
	
parede:
	sw $9, 110($5)
	
fim:
	addi $2, $0, 10
	syscall