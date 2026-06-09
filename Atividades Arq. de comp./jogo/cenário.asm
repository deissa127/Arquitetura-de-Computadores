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
	# endereços base da memória
	lui $8, 0x1001
	lui $7, 0x1001
	addi $7, $7, 0x7C00	# $7  = Início última linha (62 fun_linhas * 512 bytes por linha) -> 31744 = 0x7C00
	lui $6, 0x1001		# $6  = coluna
	lui $5, 0x1001		# $5 = imutável
	
	li $9, 0xfa5a9a		# cor
	li $19, 0xffff00	# cor
	
	addi $10, $0, 0x100		# Contador fim de linha -> 128 + 128 = 0x100 (256)
	addi $11, $0, 0x1F00	# Contador inicio de linha2 -> 8064 = 0x1F80
	addi $12, $0, 0x3F		# Contador fim linha para fazer coluna -> 63 = 0x3F

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
	beq $12, $0 , tunel
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
	
tunel: # Túnel de Teletransporte (Wrap-around)
	li $18, 0x000000	# Configura a cor PRETA (ou a cor do seu fundo)
esquerdo:
	# Apaga o lado ESQUERDO (Linhas 29 a 33)
	addi $25, $5, 0x3A00	# Endereço de início do túnel esquerdo
	addi $13, $0, 5		# Altura de 5 pixels
loop_esq:
	beq $13, $0, direito
	sw $18, 0($25)		# Pinta pixel 1 de preto
	sw $18, 4($25)		# Pinta pixel 2 de preto
	addi $25, $25, 512	# Pula para a linha de baixo
	addi $13, $13, -1
	j loop_esq

direito:
	# Apaga o lado DIREITO (Linhas 29 a 33)
	addi $25, $5, 0x3BF8	# Endereço de início do túnel direito
	addi $13, $0, 5		# Altura de 5 pixels
loop_dir:
	beq $13, $0, p		# Quando terminar os dois lados, segue para o Pacman
	sw $18, 0($25		# Pinta pixel 1 de preto
	sw $18, 4($25)		# Pinta pixel 2 de preto
	addi $25, $25, 512	# Pula para a linha de baixo
	addi $13, $13, -1
	j loop_dir
	
p:
pacman:	
	addi $25, $5, 0x5c80
	addi $13, $0, 3		# contador
	addi $15, $0, 408	# salto para a próxima coluna
	addi $16, $0, 96	# proxima linha
	jal pm
	
	addi $25, $5, 0x6E0c
	addi $13, $0, 3		# contador
	addi $15, $0, 408	# salto para a próxima coluna
	addi $16, $0, 96	# proxima linha
	jal pm
	
	addi $25, $5, 0x6E20
	addi $13, $0, 3		# contador
	addi $15, $0, 408	# salto para a próxima coluna
	addi $16, $0, 96	# proxima linha
	jal pm
	
	addi $25, $5, 0x55d4
	addi $13, $0, 3		# contador
	addi $15, $0, 408	# salto para a próxima coluna
	addi $16, $0, 96	# proxima linha
	jal pm

	addi $25, $5, 0x74b8
	addi $13, $0, 3		# contador
	addi $15, $0, 408	# salto para a próxima coluna
	addi $16, $0, 96	# proxima linha
	jal pm

paredes:
# ----------- primeira parte -----------------
	# colunas iguais cantro superior esquerdo e direito
	addi $25, $5, 0xE20	
	addi $13, $0, 9		# contador
	addi $15, $0, 436	# salto para a próxima coluna 
	addi $16, $0, 68	# proxima linha
	jal dupla_coluna
	# segunda coluna - espelhado
	addi $25, $5, 0xE3C	
	addi $13, $0, 14	# contador
	addi $15, $0, 380	# salto para a próxima coluna
	addi $16, $0, 124	# proxima linha
	jal dupla_coluna
	# primeira linha - primeiro desenho
	addi $25, $5, 0x2A20
	addi $13, $0, 18	# (18 = 9 + 9) contador
	addi $14, $0, 9		# metade do $13
	jal fun_linha
	# linha superior serapada (1) do retângulo
	addi $25, $5, 0xE58
	addi $13, $0, 78	#  contador
	addi $14, $0, 39
	jal fun_linha
	# linha inferior serapada (1) do retângulo
	addi $25, $5, 0x2A58	# NOVA posição da memória -> 10840 = 0x2A58
	addi $13, $0, 78	#  contador
	addi $14, $0, 39
	jal fun_linha
	# linha superior serapada (2) do retângulo
	addi $25, $5, 0xF0C	# NOVA posição da memória -> 3852 = 0xF0C
	addi $13, $0, 78	#  contador
	addi $14, $0, 39
	jal fun_linha
	# linha inferior serapada (2) do retângulo
	addi $25, $5, 0x2B0C	# NOVA posição da memória  
	addi $13, $0, 78	#  contador
	addi $14, $0, 39
	jal fun_linha
	# dupla_coluna - > caixote 1
	addi $25, $5, 0x1258
	addi $13, $0, 12	# contador coluna
	addi $15, $0, 324	# salto para a próxima coluna
	addi $16, $0, 180	# proxima linha
	jal dupla_coluna
	# linha central do retângulo
	addi $25, $5, 0x1C78  
	addi $13, $0, 134	#  contador
	addi $14, $0, 67
	jal fun_linha
	# ultima linha primeira parte
	addi $25, $5, 0x2BBC 
	addi $13, $0, 18	# (18 = 9 + 9) contador
	addi $14, $0, 9		# metade do $13
	jal fun_linha
	
# ----------- segunda parte -----------------
	
	# colunas do primeiro sorrriso
	addi $25, $5, 0x3820
	addi $13, $0, 13	# contador
	addi $15, $0, 80	# salto para a próxima coluna
	addi $16, $0, 424
	jal dupla_coluna
	# colunas do segundo sorrriso
	addi $25, $5, 0x3984
	addi $13, $0, 13	# contador
	addi $15, $0, 80	# salto para a próxima coluna
	addi $16, $0, 424
	jal dupla_coluna
	# linha - 1º sorriso
	addi $25, $5, 0x4E20	# linha
	addi $13, $0, 46	# contador
	addi $14, $0, 23	# quantidade total de pixels pintados na coluna
	jal fun_linha
	# linha espelho - 2º sorriso
	addi $25, $5, 0x4F84
	addi $13, $0, 46	# contador
	addi $14, $0, 23	# quantidade total de pixels pintados na coluna
	jal fun_linha
	# colunas do olho 1º sorrriso
	addi $25, $5, 0x383C
	addi $13, $0, 6		# contador
	addi $15, $0, 24	# salto para a próxima coluna
	addi $16, $0, 480
	jal dupla_coluna
	# colunas do olho 2º sorrriso
	addi $25, $5, 0x39A0
	addi $13, $0, 6		# contador
	addi $15, $0, 24	# salto para a próxima coluna
	addi $16, $0, 480
	jal dupla_coluna
	# linha do centro quebrada 1ª
	addi $25, $5, 0x3890
	addi $13, $0, 50	# contador
	addi $14, $0, 25	# quantidade total de pixels pintados na coluna
	jal fun_linha
	# linha do centro quebrada 2ª
	addi $25, $5, 0x390C
	addi $13, $0, 50	# contador
	addi $14, $0, 25	# quantidade total de pixels pintados na coluna
	jal fun_linha
	# linha do centro inferior 
	addi $25, $5, 0x4E90
	addi $13, $0, 112	# contador
	addi $14, $0, 56	# quantidade total de pixels pintados na coluna
	jal fun_linha
	# coluna - > caixote 2
	addi $25, $5, 0x3890
	addi $13, $0, 13	# contador
	addi $15, $0, 212	# salto para a próxima coluna
	addi $16, $0, 292	# proxima linha
	jal dupla_coluna
	
# ----------- terceira parte -----------------

	# linha superior do J
	addi $25, $5, 0x5c20	# fun_linha espelho coluna_unica2
	addi $13, $0, 46	# contador pl4
	addi $14, $0, 23	# quantidade total de pixels pintados na coluna
	jal fun_linha
	# linha inferior do J inferior
	addi $25, $5, 0x6E30	# fun_linha espelho coluna_unica2
	addi $13, $0, 34	# contador pl4
	addi $14, $0, 17	# quantidade total de pixels pintados na coluna
	jal fun_linha
	# coluna grande do J
	addi $25, $5, 0x5C6C	# coluna
	addi $13, $0, 11	# contador
	jal coluna_unica
	# coluna pontinho J
	addi $25, $5, 0x6a30	# fun_linha
	addi $13, $0, 3		# contador
	jal coluna_unica
	# brotanto do chão 1
	addi $25, $5, 0x6AA4	# coluna
	addi $13, $0, 9		# contador
	jal coluna_unica
	# brotanto do chão 2 e 3
	addi $25, $5, 0x6Af8	# coluna
	addi $13, $0, 9		# contador
	addi $15, $0, 80	# salto para a próxima coluna
	addi $16, $0, 424
	jal dupla_coluna
	# T - linha
	addi $25, $5, 0x5c90
	addi $13, $0, 112	# contador
	addi $14, $0, 56	# quantidade total de pixels pintados na coluna
	jal fun_linha
	# T - colunas
	addi $25, $5, 0x60d0	# coluna
	addi $13, $0, 9		# contador
	addi $15, $0, 80	# salto para a próxima coluna
	addi $16, $0, 424
	jal dupla_coluna
	# colunas do H
	addi $25, $5, 0x5d84	# fun_linha 
	addi $13, $0, 11	# contador
	addi $15, $0, 80	# salto para a próxima coluna
	addi $16, $0, 424
	jal dupla_coluna
	# linha do H
	addi $25, $5, 0x6784	# fun_linha 
	addi $13, $0, 46	# contador
	addi $14, $0, 23	# quantidade total de pixels pintados na coluna
	jal fun_linha
	

	j fim
	
fim:
	addi $2, $0, 10
	syscall
	
# ---------- funções: paredes (esquerda -> direita / cima -> baixo)---------------
pm:	
	beq $13, $0, fc
	sw $19, 0($25)	# pixel 1
	addi $25, $25, 4
	sw $19, 0($25)	# pixel 2
	addi $25, $25, 4
	sw $19, 0($25)	# pixel 
	addi $25, $25, 504
	addi $13, $13, -1
	j pm
fc:	jr $31



coluna_unica:	# coluna unica
	beq $13, $0, col
	sw $9, 0($25)	# pixel 1
	addi $25, $25, 4
	sw $9, 0($25)	# pixel 2
	addi $25, $25, 508
	addi $13, $13, -1
	j coluna_unica
col:	jr $31
# --------------------
fun_linha:	# fun_linha
	beq $13, $14 , lnh
	sw $9, 0($25)	# pixel 1
	addi $25, $25, 4
	addi $13, $13, -1
	j fun_linha
lnh:	addi $25, $25, 508
fl:	beq $13, $0, ln
	sw $9, 0($25)	# pixel 2
	addi $25, $25, -4
	addi $13, $13, -1
	j fl
ln:	jr $31
# -------------------- 
dupla_coluna:
	beq $13, $0, dc
	sw $9, 0($25)	# pixel 1
	addi $25, $25, 4
	sw $9, 0($25)	# pixel 2
	add $25, $25, $15
	sw $9, 0($25)	# coluna 2 pixel 1
	addi $25, $25, 4
	sw $9, 0($25)	# coluna 2 pixel 2
	add $25, $25, $16
	addi $13, $13, -1
	j dupla_coluna
dc:	jr $31
# --------------------