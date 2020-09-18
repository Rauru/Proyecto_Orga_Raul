addi $sp, $sp, -16

li $t0, 60
sw $t0, 0($sp)

li $t0, 15
sw $t0, 4($sp)

li $t0, 1
sw $t0, 8($sp)

li $v0, 1
syscall

li $v0, 0
syscall



begin:
li $v0, 0
syscall

li $t0, 120
li $t1, 31
li $t2, 1
li $a3, 0
li $a2, 32
li $t4, 0
;fory:
;   beq $t1, $t2, endfory   
   
;   li $t3, 1
;   forx:
;   beq $t0, $t3, endforx
   
;   move $a0, $t3
;   move $a1, $t2
;   li $v0, 20
;   syscall
   ;#show $t0
   
;   addi $t4, $t4, 1

;   addi $t3, $t3, 1
;   j forx
;   endforx:
;   addi $t2, $t2, 1
;   j fory
   
;endfory:


draw_ship:
   li $a2, 35
   lw $a0, 0($sp)
   lw $a1, 4($sp)
   li $a3, 3
   li $v0, 20
   syscall
   li $a2, 35
   addi $a0, $a0, -1
   li $v0, 20
   syscall
   li $a2, 35
   addi $a0, $a0, 2
   lw $a1, 4($sp)
   li $a3, 3
   li $v0, 20
   syscall


li $a3, 0
li $a0, 120
li $a1, 30
li $v0, 20
syscall


;#show $t4


loop:

;delta:
 ;  beq $t1, $t2, endfory   
;enddelta:
li $v0, 55
syscall

li $v0, 21
syscall

isup:
li $t0, 119
bne $a0, $t0, isdown	;# if  != $t1 then target
lw $a1, 4($sp)
addi $a1, $a1, -1
sw $a1, 4($sp)
;#show $v0
;#show $a0

isdown:
li $t0, 115
bne $a0, $t0, isleft	;# if $t0 != $t1 then target
lw $a1, 4($sp)
addi $a1, $a1, 1
sw $a1, 4($sp)
#show $v0
#show $a1

isleft:
li $t0, 97
bne $a0, $t0, isright
lw $a0, 0($sp)
addi $a0, $a0, -1
sw $a0, 0($sp)
;#show $v0
;#show $a0

isright:
li $t0, 100
bne $a0, $t0, done
lw $a0, 0($sp)
addi $a0, $a0, 1
sw $a0, 0($sp)
;#show $v0
;#show $a0

done:
;lw $a0, 0($sp)
;addi $a0, $a0, -1
;sw $a0, 0($sp)
j begin

j loop
