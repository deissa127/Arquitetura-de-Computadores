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
        mfhi $11

        div $7, $5
        mflo $7
        mfhi $10

        div $7, $5
        mflo $7
        mfhi $9
        
        div $7, $5
        mfhi $8
        
        # milhar
        sub $12, $0, $8
        srl $12, $12, 31
        sll $12, $12, 4
        addi $4, $8, 32
        add $4, $4, $12
        addi $2, $0, 11
        syscall
        
        # centena
        sub $13, $0, $9
        srl $13, $13, 31
        sll $13, $13, 4
        addi $4, $9, 32
        add $4, $4, $13
        addi $2, $0, 11
        syscall
        
        # dezena
        sub $14, $0, $10
        srl $14, $14, 31
        sll $14, $14, 4
        addi $4, $10, 32
        add $4, $4, $14
        addi $2, $0, 11
        syscall
        
        # unidade
        sub $15, $0, $11
        srl $15, $15, 31
        sll $15, $15, 4
        addi $4, $11, 32
        add $4, $4, $15
        addi $2, $0, 11
        syscall
        
        addi $2, $0, 10
        syscall