// Guessing:
// a - $s0
// b - $s1
// i - $t0
// j - $t1
// adress[D] - $s2

// C code:
// for(i = 0; i < a; i++)
//    for(j = 0; j < b; j++)
// 	    D[4*j] = i + j;

add $t0, $zero, $zero // i = 0
add $t1, $zero, $zero // j = 0

loop_one:
slt $t2, $t0, $s0 // $t2 = 1 if i < a
beq $t2, $zero, EXIT_I // if $t2 = 0 go to EXIT_I

loop_two:
slt $t2, $t1, $s1 // $t2 = 1 if j < b
beq $t2, $zero, EXIT_J // if $t2 = 0 go to EXIT_J
li $t3, 4 // $t3 = 4
mul $t3, $t3, $t1 // $t3 = 4*j
add $t3, $t3, $s2 // $t3 = 4*j + end[D]
add $t4, $t0, $t1 // $t4 = i + j
sw $t4, 0 ($t3) // D[4*j] = i + j
addi $t1, $t1, 1
j loop_two

EXIT_J:
addi $t0, $t0, 1
j loop_one

EXIT_I:
...
