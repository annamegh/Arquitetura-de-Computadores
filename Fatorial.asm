	 # Feito em parceria com Monique Hemily
	.text
	.globl main
main:
	li $s0, 1  # $s0 = 1
	li $s1, 0  # $s1 = 0
	li $v0, 5  # cód para ler um número do teclado e salvá-lo em $v0
	syscall
	add $s1, $s1, $v0  # $s1 += $v0
fatorial:
	mul $s0, $s0, $s1  # $s0 *= $s1
	sub $s1, $s1, 1  # $s1 -= 1
	bne $s1, $zero, fatorial  # se $s1 != 0 vá para fatorial
endfat:
	move $a0, $s0  # $a0 = $s0
	li $v0, 1  # cód para printar um int salvo em $a0 na tela
	syscall
end:
	li $v0, 10
	syscall