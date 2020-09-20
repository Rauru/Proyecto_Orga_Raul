addi $sp, $sp, -24

li $t0, 10
sw $t0, 0($sp)

li $t0, 15
sw $t0, 4($sp)

li $t0, 1
sw $t0, 8($sp)

li $t0,  0
sw $t0, 12($sp)

;#ovni 1
li $t0, 100
sw $t0, 16($sp)

li $t0, 5
sw $t0, 20($sp)

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


draw_ovni:
   li $a0, 4
   li $v0, 22
   syscall
   li $a3, 4
   li $a2, 32
   lw $a0, 16($sp)
   lw $a1, 20($sp)
   
   li $v0, 20
   syscall

draw_ship:
  lw $t0, 8($sp)
  li $t1, 0
  beq $t0, $t1, facing_left


facing_right:
   li $a0, 3
   li $v0, 22
   syscall

   li $a3, 0
   li $a2, 35
   lw $a0, 0($sp)
   lw $a1, 4($sp)
   
   li $v0, 20
   syscall
   
   li $a2, 35
   addi $a0, $a0, 1
   li $v0, 20
   syscall
   
   li $a2, 62
   addi $a0, $a0, 1
   lw $a1, 4($sp)
   li $v0, 20
   syscall
   j loop
facing_left:
   li $a0, 3
   li $v0, 22
   syscall

   li $a3, 0
   li $a2, 60
   lw $a0, 0($sp)
   lw $a1, 4($sp)
   
   li $v0, 20
   syscall
   
   li $a2, 35
   addi $a0, $a0, 1
   li $v0, 20
   syscall
   
   li $a2, 35
   addi $a0, $a0, 1
   lw $a1, 4($sp)
   li $v0, 20
   syscall


;li $a3, 0
;li $a0, 120
;li $a1, 30
;li $v0, 20
;syscall


;#show $t4


loop:



;li $v0, 55
;syscall

li $v0, 21
syscall

li $t0, 112000 ;110500
;#show $t0
li $t1, 0
delta:

beq $t0, $t1, enddelta
addi $t1, $t1, 1

j delta 
enddelta:


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
;#show $v0
;#show $a1

isleft:
li $t0, 97
bne $a0, $t0, isright
;lw $t0, 0($sp)
;addi $t0, $t0, -1
;sw $t0, 0($sp)
li $t0, 0
sw $t0, 8($sp)
li $t0, 1
sw $t0, 12($sp)
;#show $v0
;#show $a0

isright:
li $t0, 100
bne $a0, $t0, done
;lw $a0, 0($sp)
;addi $a0, $a0, 1
;sw $a0, 0($sp)
li $t0, 1
sw $t0, 8($sp)

sw $t0, 12($sp)
;#show $v0
;#show $a0

done:

lw $t0, 12($sp)
li $t1, 1
beq $t0, $t1, drift

j skip
drift:
li $t0, 0
lw $t1, 8($sp)
beq $t0, $t1, drift_left



drift_right:
li $t0, 10
lw $t1, 0($sp)
beq $t0, $t1, end_drift
addi $t1, $t1, -2
sw $t1, 0($sp)

j skip

drift_left:
li $t0, 100
lw $t1, 0($sp)
beq $t0, $t1, end_drift
addi $t1, $t1, 2
sw $t1, 0($sp)

j skip
end_drift:
li $t0,0
sw $t0, 12($sp)

skip:


j begin

j loop
