# 18. Faça um programa que leia dois números e informe o menor deles (use apenas
#     operações aritméticas e lógicas.

.text
main:
        addi $2, $0, 5
        syscall
        add $8, $0, $2
        
        addi $2, $0, 5
        syscall
        add $9, $0, $2
        
        sub $10, $8, $9
        not $11, $10
        srl $20, $10, 31
        srl $21, $11, 31
        mul $15, $8, $20
        mul $16, $9, $21
        add $4, $15, $16
        
        addi $2, $0, 1
        syscall
        
        addi $2, $0, 10
        syscall