.data
str1: .asciiz "maior\n" # definindo a string str1
str2: .asciiz "\nmenor\n" # definindo a string str2
	.text
	.globl main
main:
	li $v0, 5
	syscall
	or $a0, $zero, $v0 # passa para a0 o valor digitado pelo usuário
	li $v0, 5
	syscall
	or $a1, $zero, $v0 # passa para a1 o valor digitado pelo usuário
	li $v0, 5
	syscall
	or $a2, $zero, $v0 # passa para a2 o valor digitado pelo usuário
	jal compara # chama a função
	or $t0, $zero, $v0 # $t0 = $v0
	or $t1, $zero, $v1 # $t1 = $v1
	la $a0, str1  # carrega a str1a para $a0
	li $v0, 4  # printa a str1a
	syscall
	or $a0, $zero, $t0 
	li $v0, 1 # printa $t0
	syscall
	la $a0, str2  # carrega a str2 para $a0
	li $v0, 4  # printa a str2
	syscall
	or $a0, $zero, $v1
	li $v0, 1 # printa $t1
	syscall
end:
	li $v0, 10
	syscall
compara:
	addi $sp, $sp, -12 # aloca espaço
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	sw $s2, 8($sp)
	slt $s0, $a1, $a0 # retorna 1 se a1 < a0, retorna 0 se a1 > a0
	bnez $s0, a0_maior # vai para a0_maior se $s0 != 0 (se a0 é maior)
	or $s1, $zero, $a1 # se a1 é maior
	or $s2, $zero, $a0 # a0 menor
	j a1_maior
a0_maior: # compara a0 e a2
	or $s1, $zero, $a0 # a0 maior
	or $s2, $zero, $a1 # a1 menor
	slt $s0, $s1, $a2 # retorna 1 se $s1 < $a0
	bnez $s0, a2_maior # se $s0 é 1 (a2 maior), vai para a2_maior
	j menor
a1_maior: # compara a1 e a2
	slt $s0, $s1, $a2 # retorna 1 se a2 é maior 
	bnez $s0, a2_maior
	j menor
a2_maior: # se a2 é maior, passa ele para s1, se nao pula antes para menor
	or $s1, $zero, $a2 
menor:
	slt $s0, $s2, $a2 #compara se a0 ou a1 é menor que a2
	bnez $s0, final_compara # s0 != 0, s2 é menor
	or $s2, $zero, $a2 # s0 == 0, a2 é menor
final_compara:
	or $v0, $zero, $s1 # passa o maior valor para v0
	or $v1, $zero, $s2 # passa o menor valor para v1
	lw $s0, 0($sp)
	lw $s1, 4($sp)
	lw $s2, 8($sp)
	addi $sp, $sp, 12
	jr $ra