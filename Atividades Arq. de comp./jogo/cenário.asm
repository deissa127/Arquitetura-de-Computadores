# pixel dividido pro 4 = 32256 bytes
# total de pixels (4*4) = 8192 pixels
# linha = 128	(128 pixels * 4 bytes = 512 bytes por linha)
# coluna = 64 (32256 / 512)

# as paredes tem 2 pixels de largura
# espaço entre paredes é no mínimo 5 pixels


#  sw $4, 2048($8)  # cópia do cenário

# --------------- CENÁRIO ----------------------

.text
main:
	lui $8, 0x1001
	lui $7, 0x1001
	addi $7, $7, 0x7C00	# $7  = Início última linha (62 linhas * 512 bytes por linha) -> 31744 = 0x7C00
	lui $6, 0x1001		# $6  = coluna
	lui $5, 0x1001
	
	li $9, 0xfa5a9a		# cor
	li $19, 0xffff00		# cor
	
	addi $10, $0, 0x100	# Contador fim de linha -> 128 + 128 = 0x100 (256)
	addi $11, $0, 0x1F00	# Contador inicio de linha2 -> 8064 = 0x1F80
	addi $12, $0, 0x3F	# Contador fim linha para fazer coluna -> 63 = 0x3F

linha:
	beq $10, $0, linha2
	sw $9, 0($8)
	addi $8, $8, 4		# próximo pixel
	addi $10, $10, -1	# contador
	j linha
	
	
linha2:
	beq $11, 0x2000, colunas # 0x2000 = 8192
	sw $9, 0($7)
	addi $7, $7, 4		# próximo pixel
	addi $11, $11, 1	# contador
	j linha2
	
colunas:	# 500 + 4 + 4 + 4 = 512 pixels
	beq $12, $0 , p
	sw $9, 0($6)		# 1º Pinta o pixel 1 da COLUNA ESQUERDA
	addi $6, $6, 4
	sw $9, 0($6)		# 1º Pinta o pixel 2 da COLUNA ESQUERDA
	addi $6, $6, 500	# Pula para o penúltimo pixel da linha
	sw $9, 0($6)		# 2º Pinta o pixel 1 da COLUNA DIREITA
	addi $6, $6, 4		# Anda para prox pixel
	sw $9, 0($6)		# 2º Pinta o pixel 2 da COLUNA DIREITA
	addi $6, $6, 4		# Anda +1 pixel ou +4 bytes para ir para a PRÓXIMA linha
	addi $12, $12, -1	# contador
	j colunas
	
p:	
	addi $25, $5, 0x38f8	# NOVA posição da memória -> p2  3640 = 0xE38
	addi $13, $0, 3		# contador p2
	addi $15, $0, 408	# salto para a próxima coluna
	addi $16, $0, 96	# proxima linha
	jal pc
	
	addi $25, $5, 0x3880	# NOVA posição da memória -> p2  3640 = 0xE38
	addi $13, $0, 3		# contador p2
	addi $15, $0, 408	# salto para a próxima coluna
	addi $16, $0, 96	# proxima linha
	jal pc
	
	addi $25, $5, 0x3974	# NOVA posição da memória -> p2  3640 = 0xE38
	addi $13, $0, 3		# contador p2
	addi $15, $0, 408	# salto para a próxima coluna
	addi $16, $0, 96	# proxima linha
	jal pc
	
	addi $25, $5, 0x55d4	# NOVA posição da memória -> p2  3640 = 0xE38
	addi $13, $0, 3		# contador p2
	addi $15, $0, 408	# salto para a próxima coluna
	addi $16, $0, 96	# proxima linha
	jal pc



	# p1 -> colunas iguais cantro superior esquerdo e direito
	addi $25, $5, 0xE20	# posição da primeira parede -> p1 3612 = 0xE1C
	addi $13, $0, 9		# contador p1
	addi $15, $0, 436	# salto para a próxima coluna 
	addi $16, $0, 68	# proxima linha
	jal p8
	# p2 -> igual ao p1
	addi $25, $5, 0xE3C	# NOVA posição da memória -> p2  3640 = 0xE38
	addi $13, $0, 14	# contador p2
	addi $15, $0, 408	# salto para a próxima coluna
	addi $16, $0, 96	# proxima linha
	jal p1
	# p3
	addi $25, $5, 0x2A20	# NOVA posição da memória -> pl3  10780 = 0x2A1C
	addi $13, $0, 18	# (18 = 9 + 9) contador pl3
	addi $14, $0, 9		# metade do $13
	jal p3
	# p4
	addi $25, $5, 0xE58	# NOVA posição da memória -> p2  3672 = 0xE58
	addi $13, $0, 78	#  contador pl4
	addi $14, $0, 39
	jal p3
	# p5
	addi $25, $5, 0x2A58	# NOVA posição da memória -> p2  10840 = 0x2A58
	addi $13, $0, 78	#  contador pl5
	addi $14, $0, 39
	jal p3
	# p6
	addi $25, $5, 0xF0C	# NOVA posição da memória -> p2  3856 = 0xF10
	addi $13, $0, 78	#  contador pl6
	addi $14, $0, 39
	jal p3
	# p7
	addi $25, $5, 0x2B0C	# NOVA posição da memória -> p2  
	addi $13, $0, 78	#  contador pl7
	addi $14, $0, 39
	jal p3
	# p8 - > caixote 1
	addi $25, $5, 0x1258	# posição da primeira parede -> p8
	addi $13, $0, 12	# contador p8
	addi $15, $0, 324	# salto para a próxima coluna
	addi $16, $0, 180	# proxima linha
	jal p8
	# p9
	addi $25, $5, 0x1C78	# NOVA posição da memória -> p2  
	addi $13, $0, 134	#  contador pl9
	addi $14, $0, 67
	jal p3
	# p10 -> mesma coisa que p1
	addi $25, $5, 0xFBC	# posição da primeira parede -> p10 
	addi $13, $0, 14	# contador p1
	jal p1
	# p11 -> ultima linha primeira parte
	addi $25, $5, 0x2BBC	# NOVA posição da memória -> pl11  
	addi $13, $0, 18	# (18 = 9 + 9) contador pl3
	addi $14, $0, 9		# metade do $13
	jal p3
	# p12 -  colunas do primeiro sorrriso
	addi $25, $5, 0x3820	# posição da primeira parede -> p12
	addi $13, $0, 13	# contador p1
	addi $15, $0, 80	# salto para a próxima coluna
	addi $16, $0, 424
	jal p8
	# p13 -  colunas do segundo sorrriso
	addi $25, $5, 0x3984	# espelho p12
	addi $13, $0, 13	# contador p1
	addi $15, $0, 80	# salto para a próxima coluna
	addi $16, $0, 424
	jal p8
	# p14
	addi $25, $5, 0x4E20	# linha 1 segunda parte
	addi $13, $0, 46	# contador pl4
	addi $14, $0, 23	# quantidade total de pixels pintados na coluna
	jal p3
	#p15
	addi $25, $5, 0x4F84	# linha espelho p12
	addi $13, $0, 46	# contador pl4
	addi $14, $0, 23	# quantidade total de pixels pintados na coluna
	jal p3
	# p16 - colunas do olho primeiro sorrriso
	addi $25, $5, 0x383C	# posição da primeira parede -> p12
	addi $13, $0, 6		# contador p1
	addi $15, $0, 24	# salto para a próxima coluna
	addi $16, $0, 480
	jal p8
	# p1  -  colunas do olho segundo sorrriso
	addi $25, $5, 0x39A0	# posição da primeira parede -> p12
	addi $13, $0, 6		# contador p1
	addi $15, $0, 24	# salto para a próxima coluna
	addi $16, $0, 480
	jal p8
	# linha do centro quebrada 1ª
	addi $25, $5, 0x3890	# linha 2 segunda parte
	addi $13, $0, 50	# contador pl4
	addi $14, $0, 25	# quantidade total de pixels pintados na coluna
	jal p3
	# linha do centro quebrada 2ª
	addi $25, $5, 0x390C	# linha 2.1 segunda parte
	addi $13, $0, 50	# contador pl4
	addi $14, $0, 25	# quantidade total de pixels pintados na coluna
	jal p3
	# linha do centro inferior 
	addi $25, $5, 0x4E90	# linha 3 segunda parte
	addi $13, $0, 112	# contador pl4
	addi $14, $0, 56	# quantidade total de pixels pintados na coluna
	jal p3
	# p8 - > caixote 2
	addi $25, $5, 0x3890	# posição da primeira parede -> p8
	addi $13, $0, 13	# contador p8
	addi $15, $0, 212	# salto para a próxima coluna
	addi $16, $0, 292	# proxima linha
	jal p8
	#p15
	addi $25, $5, 0x5d84	# linha espelho p12
	addi $13, $0, 46	# contador pl4
	addi $14, $0, 23	# quantidade total de pixels pintados na coluna
	jal p3
	#p15 - linha final
	addi $25, $5, 0x6F84	# linha espelho p12
	addi $13, $0, 46	# contador pl4
	addi $14, $0, 23	# quantidade total de pixels pintados na coluna
	jal p3
	
	

	j fim
	
fim:
	addi $2, $0, 10
	syscall
	
# ---------- funções: paredes (esquerda -> direita / cima -> baixo)---------------
pc:	
	beq $13, $0, fc
	sw $19, 0($25)	# pixel 1
	addi $25, $25, 4
	sw $19, 0($25)	# pixel 2
	addi $25, $25, 4
	sw $19, 0($25)	# pixel 
	addi $25, $25, 504
	addi $13, $13, -1
	j pc
fc:	jr $31



p1:	
	beq $13, $0, f1
	sw $9, 0($25)	# pixel 1
	addi $25, $25, 4
	sw $9, 0($25)	# pixel 2
	addi $25, $25, 508
	addi $13, $13, -1
	j p1
f1:	jr $31
# --------------------
p3:	# colado/pedaço com p2
	beq $13, $14 , pal3
	sw $9, 0($25)	# pixel 1
	addi $25, $25, 4
	addi $13, $13, -1
	j p3
pal3:	addi $25, $25, 508
pl3:	beq $13, $0, f3
	sw $9, 0($25)	# pixel 2
	addi $25, $25, -4
	addi $13, $13, -1
	j pl3
f3:	jr $31
# -------------------- 
p8:	# colunas caixote
	beq $13, $0, f8
	sw $9, 0($25)	# pixel 1
	addi $25, $25, 4
	sw $9, 0($25)	# pixel 2
	add $25, $25, $15
	sw $9, 0($25)	# coluna 2 pixel 1
	addi $25, $25, 4
	sw $9, 0($25)	# coluna 2 pixel 2
	add $25, $25, $16
	addi $13, $13, -1
	j p8
f8:	jr $31
# --------------------
