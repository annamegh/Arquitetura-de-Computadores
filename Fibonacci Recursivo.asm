#colaboração com Amyr Allan e Vinícius Hansen

.data
str1: .asciiz "\n"
	.text
	.globl main
main:
	li $v0, 5
	syscall
	or $a0, $zero, $v0 # N
	jal fibonacci
	move $a0, $v0
	li $v0, 1
	syscall # imprimir
end:
	li $v0, 10
	syscall

fibonacci:
	ori $v0, $zero, 0 # zera 0 $v0
	
	addi $sp, $sp, -8  # salva o conteúdo de $s0 e o endereço da main na pilha
	sw $s0, 0($sp)
	sw $ra, 4($sp)
	
	or $s0, $zero, $a0 # s0 = a0
	jal recursao 
	
	lw $s0, 0($sp) # carrega o conteúdo original de $s0 e o endereço da main
	lw $ra, 4($sp)
	addi $sp, $sp, 8
	jr $ra  # volta pra main
	
recursao:
	blt $s0, 2, fibonacci_final
	
	addi $sp, $sp, -8 
	sw $s0, 0($sp) # salva na pilha
	sw $ra, 4($sp)

	addi $s0, $s0, -1 # f(n-1)
	jal recursao
		
	lw $s0, 0($sp) # carrega da pilha
	lw $ra, 4($sp)
	addi $sp, $sp, 8
		
	addi $s0, $s0, -2 # f(n-2)
	j recursao

fibonacci_final:
	
	addi $v0, $v0, 1 # caso base, v0 += 1
	jr $ra
