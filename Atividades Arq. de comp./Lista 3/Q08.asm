# 8. Faça um programa que leia números inteiros diferentes de zero e encontre o menor
#    valor digitado e o maior valor digitado. O programa informa o maior e o menor, um em
#    cada linha, quando o usuário digitar um 0.

.text
main:
# Lê o primeiro número para inicializar maior e menor
    addi $2, $0, 5
    syscall
    add $8, $0, $2         # $8 = número lido

    beq $8, $0, fim         # Se já começar com 0, vai pro fim

    add $18, $0, $8         # maior = primeiro número
    add $19, $0, $8         # menor = primeiro número

# ----------CORPO DO LAÇO--------------
laco:
    addi $2, $0, 5
    syscall
    add $8, $0, $2         # $8 = número lido

teste:
    beq $8, $0, fim         # Se digitou 0, encerra

comp_maior:
    slt $25, $18, $8        # $25 = 1 se maior_atual < novo número
    beq $25, $0, comp_menor # Não é maior, testa se é menor
    add $18, $0, $8         # Atualiza maior
    j prox

comp_menor:
    slt $25, $8, $19        # $25 = 1 se novo número < menor_atual
    beq $25, $0, prox       # Não é menor, próxima iteração
    add $19, $0, $8         # Atualiza menor

#-------FIM DO CORPO DO LAÇO--------------
prox:
    j laco

fim:
    # Imprime maior
    add $4, $0, $18
    addi $2, $0, 1
    syscall

    addi $4, $0, '\n'
    addi $2, $0, 11
    syscall

    # Imprime menor
    add $4, $0, $19
    addi $2, $0, 1
    syscall

    # Encerra
    addi $2, $0, 10
    syscall