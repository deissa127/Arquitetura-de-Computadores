# 09. Leia um vetor com 10 números inteiros. Escreva os elementos do vetor eliminando
#     elementos repetidos. Use um vetor auxiliar para guardar os elementos não repetidos.

# minha lógica estava errada, por isso desisti de tentar concertar e pedi pro claude terminar o serviço :)


.data
    A:   .word 0,0,0,0,0,0,0,0,0,0     # vetor original
    Aux: .word 0,0,0,0,0,0,0,0,0,0     # vetor auxiliar

.text
main:				# la = (Load Address) carrega o endereço de uma variável declarada no .data
    la $7, A                    # $7 = base original
    la $13, Aux                 # $13 = base auxiliar
    addi $14, $0, 0             # $14 = tamanho do auxiliar
    add $8, $0, $7
    addi $10, $0, 10

#----------LEITURA----------
ent:
    beq $10, $0, copiar
    addi $2, $0, 5
    syscall
    sw $2, 0($8)
    addi $8, $8, 4
    addi $10, $10, -1
    j ent

#----------COPIA SEM REPETIDOS----------
copiar:
    addi $20, $0, 0             # i = 0 (percorre original)

ext:
    slti $15, $20, 10		# slti = compação com constante     $a > b = $x -> 0 // $a < b = $x -> 1
    beq $15, $0, imprimir       # i >= 10

    sll $25, $20, 2		# $20 * 4 => indice de A
    add $25, $7, $25
    lw $22, 0($25)              # $22 = A[i]

    addi $21, $0, 0             # j = 0 (percorre auxiliar)
    addi $12, $0, 0             # $12 = 0 (não achou)

int:
    beq $21, $14, fim_int       # j == tamanho auxiliar: não achou

    sll $25, $21, 2
    add $25, $13, $25
    lw $23, 0($25)              # $23 = Aux[j]

    bne $22, $23, prox_int      # diferente, próximo j
    addi $12, $0, 1             # achou igual
    j fim_int

prox_int:
    addi $21, $21, 1            # j++
    j int

fim_int:
    bne $12, $0, prox_ext       # já existe, pula

    sll $25, $14, 2             # não existe: insere no auxiliar
    add $25, $13, $25
    sw $22, 0($25)              # Aux[tamanho] = A[i]
    addi $14, $14, 1            # tamanho++

prox_ext:
    addi $20, $20, 1            # i++
    j ext

#----------IMPRESSÃO----------
imprimir:
    addi $20, $0, 0             # i = 0

imp:
    beq $20, $14, fim

    sll $25, $20, 2
    add $25, $13, $25
    lw $4, 0($25)               # $4 = Aux[i]

    addi $v0, $0, 1
    syscall

    addi $4, $0, ' '
    addi $v0, $0, 11
    syscall

    addi $20, $20, 1
    j imp

fim:
    addi $v0, $0, 10
    syscall
