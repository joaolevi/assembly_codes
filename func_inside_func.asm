int f(int a, int b, int c, int d){
    return func(func(a, b), c + d);
}

where:
int func(int a, int b)

Guessin:
$a0 - a
$a1 - b
$a2 - c
$a3 - d

main:
...
(código principal)
...

jal f
f:
addi $sp, $sp, -16 // save 16 bytes in the stack
sw $a0, 0 ($sp) // a
sw $a1, 4 ($sp) // b
sw $a2, 8 ($sp) // c
sw $a3, 12 ($sp) // d
sw $ra, 16 ($sp)
jal func
func:
jal func
add $a1, $a2, $a3 // b = c + d
add $a0, $v0, $zero // a = func(a, b)
jal func
add $v0, $v0, $zero
lw $a0, 0 ($sp) // a
lw $a1, 4 ($sp) // b
lw $a2, 8 ($sp) // c
lw $a3, 12 ($sp) // d
lw $ra, 16 ($sp)
addi $sp, $sp, 16 // free bytes
jr $ra












