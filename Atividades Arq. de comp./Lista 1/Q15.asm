# 15. Faça um programa que leia um número inteiro entre 0 e 9999 e imprima esse
#     número com 4 caracteres, substituindo o algarismo 0 por espaço.
#     Exemplo.: 304 gera uma saída 3 4

.text
main:
        addi $5, $0, 10
        
        addi $2, $0, 5
        syscall
        add $6, $0, $2

        div $6, $5
        mflo $7
        mfhi $10

        div $7, $5
        mflo $7
        mfhi $10

        div $7, $5
        mflo $7
        mfhi $9

        