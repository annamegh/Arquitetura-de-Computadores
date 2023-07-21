	.data
str: .asciiz "ERRO" # definindo a string str
str_linha: .asciiz "\n" # definindo a string str_linha
	 
	.text
	.globl main
main:
	li $s0, 0  # $s0 = 0
	li $s1, 0  # $s1 = 0
	li $s2, 0  # $s2 = 0
	li $s3, -1
soma:
	li $v0, 5  # cód para ler um número do teclado e salvá-lo em $v0
	syscall
	beq $v0, $s3, endsoma  # se $s1 == -1 vai para endsoma
	add $s1, $s1, $v0  # $s1 += $v0  soma o número digitado pelo usuario
	add $s2, $s2, 1  # $s2 += 1  aumenta o contador em 1
	j soma  # volta para soma
endsoma:
	move $a0, $s1  # $a0 = $s0
	li $v0, 1  # cód para printar um int salvo em $a0 na tela
	syscall
	la $a0, str_linha  # carrega a str_linha para $a0
	li $v0, 4  # printa a str_linha
	syscall
	beq $s2, $zero, erromedia  # se o contador está em 0 vai para erromedia
media:
	div $s4, $s1, $s2  # $s4 = $s1/$s2  media feita com a soma e o contador
	move $a0, $s4  # $a0 = $s4
	li $v0, 1  # cód para printar um int salvo em $a0 na tela
	syscall
	j end  # pula para end
erromedia:
	la $a0, str  # carrega str para $a0
	li $v0, 4  # printa a string na tela
	syscall
end:
	li $v0, 10
	syscall