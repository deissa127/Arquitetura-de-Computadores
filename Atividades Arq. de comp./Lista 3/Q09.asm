# 9. Faça um programa leia certa quantidade de números e imprima o maior deles e
#    quantas vezes o maior número foi lido. A quantidade de números a serem lidos deve
#    ser fornecido pelo usuário.

.text
main:
    # Lê a quantidade de números
    addi $2, $0, 5
    syscall
    add $20, $0, $2         # $20 = quantidade de números

    # Lê o primeiro número para inicializar maior e contador
    addi $2, $0, 5
    syscall
    add $18, $0, $2         # $18 = maior
    addi $21, $0, 1         # $21 = contador do maior (já leu 1 igual)
    addi $20, $20, -1       # Já leu 1 número

# ----------CORPO DO LAÇO--------------
laco:
    beq $20, $0, fim        # Se leu todos, encerra

    addi $2, $0, 5
    syscall
    add $8, $0, $2         # $8 = número lido

    addi $20, $20, -1       # contador de leitura

comp_maior:
    slt $25, $18, $8        # $25 = 1 se maior_atual < novo número
    beq $25, $0, comp_igual # Não é maior, testa se é igual
    add $18, $0, $8         # Atualiza maior
    addi $21, $0, 1         # Reinicia contador (novo maior apareceu 1 vez)
    j laco

comp_igual:
    bne $8, $18, laco       # Se não é igual ao maior, próxima
    addi $21, $21, 1        # É igual: incrementa contador

    j laco

# ----------FIM DO LAÇO--------------
fim:
    # Imprime maior
    add $4, $0, $18
    addi $2, $0, 1
    syscall

    addi $4, $0, '\n'
    addi $2, $0, 11
    syscall

    # Imprime quantidade de vezes
    add $4, $0, $21
    addi $2, $0, 1
    syscall

    # Encerra
    addi $2, $0, 10
    syscall