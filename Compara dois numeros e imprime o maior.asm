	.text
	.globl main
main:
	li $v0, 5
	syscall
	or $a0, $zero, $v0
	li $v0, 5
	syscall
	or $a1, $zero, $v0
	jal compara
	or $a0, $zero, $v0
	li $v0, 1
	syscall
end:
	li $v0, 10
	syscall
compara:
	addi $sp, $sp, -4
	sw $s0, 0($sp)
	slt $s0, $a0, $a1
	bnez $s0, a0_menor
a1_menor:
	or $v0, $zero, $a0
	j final_compara
a0_menor:
	or $v0, $zero, $a1
final_compara:
	lw $s0, 0($sp)
	addi $sp, $sp, 4
	jr $ra.text
	.globl main
main:
	li $v0, 5
	syscall
	or $a0, $zero, $v0
	li $v0, 5
	syscall
	or $a1, $zero, $v0
	jal compara
	or $a0, $zero, $v0
	li $v0, 1
	syscall
end:
	li $v0, 10
	syscall
compara:
	addi $sp, $sp, -4
	sw $s0, 0($sp)
	slt $s0, $a0, $a1
	bnez $s0, a0_menor
a1_menor:
	or $v0, $zero, $a0
	j final_compara
a0_menor:
	or $v0, $zero, $a1
final_compara:
	lw $s0, 0($sp)
	addi $sp, $sp, 4
	jr $ra