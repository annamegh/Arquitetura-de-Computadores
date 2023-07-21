.data
str1: .asciiz "maior\n" # definindo a string str1
str2: .asciiz "\nmenor\n" # definindo a string str2
	.text
	.globl main
main:
	li $v0, 5
	syscall
	or $a0, $zero, $v0 # passa para a0 o valor digitado pelo usuário
	jal contador # chama a função
	move $a0, $v0
	li $v0, 1
	syscall
end:
	li $v0, 10
	syscall
contador:
	addi $sp, $sp, -12 # aloca espaço
	sw $s0, 0($sp) # resultado
	sw $s1, 4($sp) # 10
	sw $s2, 8($sp) # contador
	ori $s1, $zero, 10
	ori $s2, $zero, 0
	or $s0, $zero, $a0
while:
	div $s0, $s1
	mflo $s0
	addi $s2, $s2, 1
	bnez $s0, while 
final_contador:
	or $v0, $zero, $s2
	lw $s0, 0($sp)
	lw $s1, 4($sp)
	lw $s2, 8($sp)
	addi $sp, $sp, 12 #desaloca espaço
	jr $ra