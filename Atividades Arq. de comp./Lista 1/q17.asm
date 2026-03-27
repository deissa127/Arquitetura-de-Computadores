# 17. Faça um programa que leia dois números inteiros e calcule e imprima a média
#     aritmética simples desses dois números apresentando o resultado com um algarismo
#     na casa fracionária.
#     Ex.: 13 e 6 gera uma saída 9,5
.text
main:
        addi $8, $0, 2
        
        addi $2, $0, 5
        syscall
        add $9, $0, $2
        
        addi $2, $0, 5
        syscall
        add $10, $0, $2
        
        add $11, $9, $10
        div $11, $8
        mflo $11
        mfhi $12
        mul $12, $12, 5
        
        add $4, $0, $11
        addi $2, $0, 1
        syscall
        
        addi $4, $0, ','
        addi $2, $0, 11
        syscall
        
        add $4, $0, $12
        addi $2, $0, 1
        syscall
        
        addi $2, $0, 10 
        syscall