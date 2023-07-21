	.data
str_linha: .asciiz "\n" # definindo a string str_linha
	 
	.text
	.globl main
main:
	li $s0, 0  # $s0 = 0 contador
	li $s1, 1  # $s1 = 0 f-2
	li $s2, 1  # $s2 = 0 f-1
	li $s3, 0  # $s3 = 0 f
	li $v0, 5  # cód para ler um número do teclado e salvá-lo em $v0
	syscall
	beq $v0, $s0, endfib1  # se $v0 == 0 vai para endfib1
	beq $v0, $s1, endfib1  # se $v0 == 1 vai para endfib1
	addi $s0, $s0, 1  # caso nao seja 0 nem 1, o contador comeca em 1
fibonacci:
	add $s3, $s2, $s1  # f = f-1 + f-2
	addi $s0, $s0, 1  # aumenta o contador em 1
	addi $s1, $s2, 0  # f-2 = f-1
	addi $s2, $s3, 0  # f-1 = f
	beq $v0, $s0, endfib2  # se $v0 == contador vai para endfib2
	j fibonacci  # volta para fibonacci
endfib1:
	move $a0, $s1  # $a0 = $s1 
	li $v0, 1  # cód para printar um int salvo em $a0 na tela
	syscall
	j end
endfib2:
	move $a0, $s3  # $a0 = $s3 
	li $v0, 1  # cód para printar um int salvo em $a0 na tela
	syscall
end:
	li $v0, 10
	syscall