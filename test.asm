addi $sp, $sp, -152

li $t0, 40     ;#posX ship
sw $t0, 0($sp)

li $t0, 15      ;#posY ship
sw $t0, 4($sp)

li $t0, 1       
sw $t0, 8($sp)   ;#0 look left, 1 look right

li $t0,  0
sw $t0, 12($sp) ;#0 stop drifting, 1keep drifting

;#ovni 1
li $t0, 60      ;#x ovni1
sw $t0, 16($sp)

li $t0, 5        ;#y ovni 1
sw $t0, 20($sp)

;#OVNI 2
li $t0, 119     ;#x ovni2 
sw $t0, 24($sp)

li $t0, 29       ;#y ovni 2
sw $t0, 28($sp)

li $t0, 1
sw $t0, 32($sp) ;#ov2 updown switch

;#OVNI 3
li $t0, 15    ;#x ovni3
sw $t0, 36($sp)

li $t0, 1    ;#y ovni3
sw $t0, 40($sp)

li $t0, 0    ;#ov3 updown switch
sw $t0, 44($sp)

;#OVNI 4
li $t0, 15    ;#x ovni4
sw $t0, 48($sp)

li $t0, 25    ;#y ovni4
sw $t0, 52($sp)

li $t0, 0    ;#ov3 updown switch
sw $t0, 56($sp)
;#--------------bullets-----------------
li $t0, 200
sw $t0, 60($sp) ;#b1 x

li $t0, 100
sw $t0, 64($sp) ;#b1 y

li $t0, 1
sw $t0, 68($sp)

li $t0, 200
sw $t0, 72($sp) ;#b2 x

li $t0, 100
sw $t0, 76($sp) ;#b2 y

li $t0, 1
sw $t0, 80($sp) 

li $t0, 200
sw $t0, 84($sp) ;#b3 x

li $t0, 100
sw $t0, 88($sp) ;#b3 y

li $t0, 1
sw $t0, 92($sp)

li $t0, 200
sw $t0, 96($sp) ;#b4 x

li $t0, 100
sw $t0, 100($sp) ;#b4 y

li $t0, 1
sw $t0, 104($sp)

li $t0, 1
sw $t0, 108($sp) ;#which bullet
;#---------------SCORES---------

li $t0, 0
sw $t0, 112($sp)

li $t0, 0
sw $t0, 116($sp)

li $t0, 0
sw $t0, 120($sp)

li $t0, 0
sw $t0, 124($sp)

;#=================STARS===============

li $t0, 100
sw $t0, 128($sp) ;#STAR 1 X

li $t0, 8
sw $t0, 132($sp) ;#STAR 1 Y

li $t0, 10
sw $t0, 136($sp) ;#STAR 2 X

li $t0, 10
sw $t0, 140($sp) ;#STAR 2 Y

li $t0, 70
sw $t0, 144($sp) ;#STAR 3 X

li $t0, 25
sw $t0, 148($sp) ;#STAR 3 Y
;#=====================================================

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

;draw_shoot:
   li $a0, 4
   li $v0, 22
   syscall
   li $a3, 4
   li $a2, 32
   li $a0, 60
   li $a1, 15
   
   li $v0, 20
 ;  syscall

draw_background:
   li $a0, 15
   li $v0, 22
   syscall

draw_star1:
   
   li $a3, 0
   li $a2, 43
   lw $a0, 128($sp)
   lw $a1, 132($sp)
   
   li $v0, 20
   syscall

move_star1:
   lw $t0, 8($sp)
   li $t1, 0
   beq $t0, $t1, move_star_right
   addi $a0, $a0, -1
   sw $a0, 128($sp)

   li $t1, 0
   beq $t1, $a0, reset_start_to_right

   j move_star1_done
reset_start_to_right:
   li $t1, 120
   sw $t1, 128($sp)
   j move_star1_done
move_star_right:
   addi $a0, $a0, 1
   sw $a0, 128($sp)

   li $t1, 120
   beq $t1, $a0, reset_start_to_left
    j move_star1_done
reset_start_to_left:
   li $t1, 0
   sw $t1, 128($sp)

move_star1_done:



draw_star2:
   
   li $a3, 0
   li $a2, 43
   lw $a0, 136($sp)
   lw $a1, 140($sp)
   
   li $v0, 20
   syscall

move_star2:
   lw $t0, 8($sp)
   li $t1, 0
   beq $t0, $t1, move_star_right2
   addi $a0, $a0, -1
   sw $a0, 136($sp)

   li $t1, 0
   beq $t1, $a0, reset_start_to_right2

   j move_star1_done2
reset_start_to_right2:
   li $t1, 120
   sw $t1, 136($sp)
   j move_star1_done2
move_star_right2:
   addi $a0, $a0, 1
   sw $a0, 136($sp)

   li $t1, 120
   beq $t1, $a0, reset_start_to_left2
    j move_star1_done2
reset_start_to_left2:
   li $t1, 0
   sw $t1, 136($sp)

move_star1_done2:


draw_star3:
   
   li $a3, 0
   li $a2, 43
   lw $a0, 144($sp)
   lw $a1, 148($sp)
   
   li $v0, 20
   syscall

move_star3:
   lw $t0, 8($sp)
   li $t1, 0
   beq $t0, $t1, move_star_right3
   addi $a0, $a0, -1
   sw $a0, 144($sp)

   li $t1, 0
   beq $t1, $a0, reset_start_to_right3

   j move_star1_done3
reset_start_to_right3:
   li $t1, 120
   sw $t1, 144($sp)
   j move_star1_done3
move_star_right3:
   addi $a0, $a0, 1
   sw $a0, 144($sp)

   li $t1, 120
   beq $t1, $a0, reset_start_to_left3
    j move_star1_done3
reset_start_to_left3:
   li $t1, 0
   sw $t1, 144($sp)

move_star1_done3:

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
   ;#move ovni after drawing it
move_ovni:
   lw $t0, 8($sp)
   li $t1, 0
   beq $t0, $t1, move_ovni1_right

   li $t0, -240
   beq $t0, $a0, reset_ov1_right

   addi $a0, $a0, -1
   sw $a0, 16($sp)

   j done_moving_ovni1

reset_ov1_right:
   li $a0, 119
   sw $a0, 16($sp)

   j done_moving_ovni1
move_ovni1_right:
   li $t0, 240
   beq $t0, $a0, reset_ov1_left

   addi $a0, $a0, 1
   sw $a0, 16($sp)
   j done_moving_ovni1
reset_ov1_left:

   li $a0, 1
   sw $a0, 16($sp)

done_moving_ovni1:
;#---------------OVNI 2-------------------------
draw_ovni2:
   li $a0, 4
   li $v0, 22
   syscall
   li $a3, 4
   li $a2, 32
   lw $a0, 24($sp)
   lw $a1, 28($sp)
   
   li $v0, 20
   syscall
   ;#move ovni after drawing it
move_ovni2:
   lw $t0, 32($sp)
   li $t1, 0
   beq $t0, $t1, ov2_down

   addi $a1, $a1, -1
   sw $a1, 28($sp)

   li $t0, 1
   beq $t0,$a1, ov2_switch_down

   j mov_ov2_horizontal

ov2_switch_down:
   li $t0, 0
   sw $t0, 32($sp)
   j mov_ov2_horizontal
ov2_down:
   addi $a1, $a1, 1
   sw $a1, 28($sp)

   li $t0, 30
   beq $t0,$a1, ov2_switch_up
   j mov_ov2_horizontal

ov2_switch_up:
   li $t0, 1
   sw $t0, 32($sp)

mov_ov2_horizontal:
   lw $t0, 8($sp)
   li $t1, 0
   beq $t0, $t1, move_ovni2_right

   li $t0, -240
   beq $t0, $a0, reset_ov2_right

   addi $a0, $a0, -1
   sw $a0, 24($sp)

   j done_moving_ovni2

reset_ov2_right:
   li $a0, 119
   sw $a0, 24($sp)

    j done_moving_ovni2

move_ovni2_right:
   li $t0, 240
   beq $t0, $a0, reset_ov2_left

   addi $a0, $a0, 1
   sw $a0, 24($sp)
   j done_moving_ovni2

reset_ov2_left:

   li $a0, 1
   sw $a0, 24($sp)

done_moving_ovni2:


;#------------------OVNI3---------------------


draw_ovni3:
   li $a0, 4
   li $v0, 22
   syscall
   li $a3, 4
   li $a2, 32
   lw $a0, 36($sp)
   lw $a1, 40($sp)
   
   li $v0, 20
   syscall
   ;#move ovni after drawing it
move_ovni3:
   lw $t0, 44($sp)
   li $t1, 0
   beq $t0, $t1, move_ovni3_down

   addi $a1, $a1, -1
   sw $a1, 40($sp)

   li $t0, 0
   beq $t0, $a1, switch_ov3_down
   j mov_ov3_horizontal
switch_ov3_down:
   sw $t0, 44($sp)
   j mov_ov3_horizontal

move_ovni3_down:

   addi $a1, $a1, 1
   sw $a1, 40($sp)

   li $t0, 30
   beq $t0, $a1, switch_ov3_up
   j mov_ov3_horizontal

switch_ov3_up:
   li $t0, 1
   sw $t0, 44($sp)

mov_ov3_horizontal:
   lw $t0, 8($sp)
   li $t1, 1
   beq $t0, $t1, move_ovni3_right

   li $t0, -240
   beq $t0, $a0, reset_ov3_right

   addi $a0, $a0, -1
   sw $a0, 36($sp)

   j done_moving_ovni3

reset_ov3_right:
   li $a0, 119
   sw $a0, 36($sp)

    j done_moving_ovni3

move_ovni3_right:
   li $t0, 240
   beq $t0, $a0, reset_ov3_left

   addi $a0, $a0, 1
   sw $a0, 36($sp)
   j done_moving_ovni3

reset_ov3_left:

   li $a0, 1
   sw $a0, 36($sp)


done_moving_ovni3:

;#-------------------OVNI4--------------------------
draw_ovni4:
   li $a0, 4
   li $v0, 22
   syscall
   li $a3, 2
   li $a2, 32
   lw $a0, 48($sp)
   lw $a1, 52($sp)
   
   li $v0, 20
   syscall
   ;#move ovni after drawing it

move_ovni4:
   addi $a0, $a0, 2
   sw $a0, 48($sp)

   li $t0, 241
   beq $t0, $a0, reset_ov4_left

   j move_ov4_vertical

reset_ov4_left:
   li $a0, -50
   sw $a0, 48($sp)

move_ov4_vertical:
   li $t0, 0
   lw $t1, 56($sp) 
   beq $t0, $t1, mov_ov4_down
   
   addi $a1, $a1, -1
   sw $a1, 52($sp)

   li $t0, 14
   beq $t0, $a1, switch_ov4_down

   j done_moving_ovni4

  switch_ov4_down: 
   li $t0, 0
   sw $t0, 56($sp)
  j done_moving_ovni4

mov_ov4_down:
   addi $a1, $a1, 1
   sw $a1, 52($sp)

   li $t0, 27
   beq $t0, $a1, switch_ov4_up
   j done_moving_ovni4

switch_ov4_up:
   li $t0, 1
   sw $t0, 56($sp)

done_moving_ovni4:


;#-----------------------------------------------------

draw_bullets:
   li $a0, 4
   li $v0, 22
   syscall
   li $a3, 13
   li $a2, 32
   lw $a0, 60($sp)
   lw $a1, 64($sp)

   
   li $v0, 20
   syscall





move_bullets_right:
   li $t0, 130
   slt $t1, $a0, $t0
   li $t0, 1
   beq $t0, $t1, check_if_right
   j not_shoot_right

check_if_right:
   lw $t0, 68($sp)
   li $t1, 1
   bne $t0, $t1, not_shoot_right

   addi $a0, $a0, 1
   sw $a0, 60($sp)

not_shoot_right:

move_bullets_left:
   bgtz $a0, check_if_left
   j not_shoot_left

check_if_left:
   lw $t0, 68($sp)
   li $t1, 0
   bne $t0, $t1, not_shoot_left

   addi $a0, $a0, -1
   sw $a0, 60($sp)

not_shoot_left:

;#-------------------------

draw_bullet2:
   
   li $a3, 13
   li $a2, 32
   lw $a0, 72($sp)
   lw $a1, 76($sp)

   li $v0, 20
   syscall


move_bullet2_right:
   li $t0, 130
   slt $t1, $a0, $t0
   li $t0, 1
   beq $t0, $t1, check_if_right2
   j not_shoot_right2

check_if_right2:
   lw $t0, 80($sp)
   li $t1, 1
   bne $t0, $t1, not_shoot_right2

   addi $a0, $a0, 1
   sw $a0, 72($sp)

not_shoot_right2:

move_bullet2_left:
   bgtz $a0, check_if_left2
   j not_shoot_left2

check_if_left2:
   lw $t0, 80($sp)
   li $t1, 0
   bne $t0, $t1, not_shoot_left2

   addi $a0, $a0, -1
   sw $a0, 72($sp)

not_shoot_left2:
;#---------------------------------------

draw_bullet3:
   
   li $a3, 13
   li $a2, 32
   lw $a0, 84($sp)
   lw $a1, 88($sp)

   li $v0, 20
   syscall


move_bullet3_right:
   li $t0, 130
   slt $t1, $a0, $t0
   li $t0, 1
   beq $t0, $t1, check_if_right3
   j not_shoot_right3

check_if_right3:
   lw $t0, 92($sp)
   li $t1, 1
   bne $t0, $t1, not_shoot_right3

   addi $a0, $a0, 1
   sw $a0, 84($sp)

not_shoot_right3:

move_bullet3_left:
   bgtz $a0, check_if_left3
   j not_shoot_left3

check_if_left3:
   lw $t0, 92($sp)
   li $t1, 0
   bne $t0, $t1, not_shoot_left3

   addi $a0, $a0, -1
   sw $a0, 84($sp)

not_shoot_left3:

;#------------------------

draw_bullet4:
   
   li $a3, 13
   li $a2, 32
   lw $a0, 96($sp)
   lw $a1, 100($sp)

   li $v0, 20
   syscall



move_bullet4_right:
   li $t0, 130
   slt $t1, $a0, $t0
   li $t0, 1
   beq $t0, $t1, check_if_right4
   j not_shoot_right4

check_if_right4:
   lw $t0, 104($sp)
   li $t1, 1
   bne $t0, $t1, not_shoot_right4

   addi $a0, $a0, 1
   sw $a0, 96($sp)

not_shoot_right4:

move_bullet4_left:
   bgtz $a0, check_if_left4
   j not_shoot_left4

check_if_left4:
   lw $t0, 104($sp)
   li $t1, 0
   bne $t0, $t1, not_shoot_left4

   addi $a0, $a0, -1
   sw $a0, 96($sp)

not_shoot_left4:


;#-------------------------
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

shooting:



   li $t0, 32
   bne $a0, $t0, dont_shoot

   check_which_bullet:
   lw $t0, 108($sp)
   li $t1, 1
   beq $t0, $t1, bullet1
   li $t1, 2
   beq $t0, $t1, bullet2
   li $t1, 3
   beq $t0, $t1, bullet3
   li $t1, 4
   beq $t0, $t1, bullet4

bullet1:
   lw $t0, 0($sp)
   lw $t1, 4($sp)
   lw $t2, 8($sp)
   sw $t0, 60($sp)
   sw $t1, 64($sp)
   sw $t2, 68($sp)

   ;#load next bullet
   lw $t0, 108($sp)
   addi $t0, $t0, 1
   sw $t0, 108($sp)

   j done_checking_bullets

bullet2:
   lw $t0, 0($sp)
   lw $t1, 4($sp)
   lw $t2, 8($sp)
   sw $t0, 72($sp)
   sw $t1, 76($sp)
   sw $t2, 80($sp)

   ;#load next bullet
   lw $t0, 108($sp)
   addi $t0, $t0, 1
   sw $t0, 108($sp)

   j done_checking_bullets
bullet3:
   lw $t0, 0($sp)
   lw $t1, 4($sp)
   lw $t2, 8($sp)
   sw $t0, 84($sp)
   sw $t1, 88($sp)
   sw $t2, 92($sp)

   ;#load next bullet
   lw $t0, 108($sp)
   addi $t0, $t0, 1
   sw $t0, 108($sp)

   j done_checking_bullets
bullet4:
   lw $t0, 0($sp)
   lw $t1, 4($sp)
   lw $t2, 8($sp)
   sw $t0, 96($sp)
   sw $t1, 100($sp)
   sw $t2, 104($sp)

   ;#load next bullet
   li $t0, 1
   sw $t0, 108($sp)



done_checking_bullets:
dont_shoot:


lw $t0, 12($sp)
li $t1, 1
beq $t0, $t1, drift

j skip
drift:
li $t0, 0
lw $t1, 8($sp)
beq $t0, $t1, drift_left



drift_right:
li $t0, 40
lw $t1, 0($sp)
beq $t0, $t1, end_drift
addi $t1, $t1, -2
sw $t1, 0($sp)

j skip

drift_left:
li $t0, 70
lw $t1, 0($sp)
beq $t0, $t1, end_drift
addi $t1, $t1, 2
sw $t1, 0($sp)

j skip
end_drift:
li $t0,0
sw $t0, 12($sp)

skip:

check_collision:

lw $t0, 0($sp) ;#posX ship
lw $t1, 4($sp)  ;#posY ship

lw $t2, 16($sp) ;#posX ovni1
lw $t3, 20($sp) ;#posy ovni1

li $t4, -1
add $t4, $t4, $t3
li $t5, 1
add $t5, $t5, $t3

beq $t0, $t2, check_y
j ovni1_done

check_y:

beq $t1, $t3, game_over
beq $t1, $t4, game_over
beq $t1, $t5, game_over



ovni1_done:

ovn2_collision:
   ;24,28,36, 40
   lw $t2, 24($sp) ;#posX ovni2
   lw $t3, 28($sp) ;#posy ovni2

   li $t4, -1
   add $t4, $t4, $t3
   li $t5, 1
   add $t5, $t5, $t3

   beq $t0, $t2, check_y2
   j ovni2_done

   check_y2:

   beq $t1, $t3, game_over
   beq $t1, $t4, game_over
   beq $t1, $t5, game_over

ovni2_done:

ovn3_collision:
   ;24,28,36, 40
   lw $t2, 36($sp) ;#posX ovni2
   lw $t3, 40($sp) ;#posy ovni2

   
   li $t4, -1
   add $t4, $t4, $t3
   li $t5, 1
   add $t5, $t5, $t3

   beq $t0, $t2, check_y3
   j ovni3_done

   check_y3:

   beq $t1, $t3, game_over
   beq $t1, $t4, game_over
   beq $t1, $t5, game_over

ovni3_done:

ovn4_collision:
   ;24,28,36, 40
   lw $t2, 48($sp) ;#posX ovni2
   lw $t3, 52($sp) ;#posy ovni2

   
   li $t4, -1
   add $t4, $t4, $t3
   li $t5, 1
   add $t5, $t5, $t3

   beq $t0, $t2, check_y4
   j ovni4_done

   check_y4:

   beq $t1, $t3, game_over
   beq $t1, $t4, game_over
   beq $t1, $t5, game_over

ovni4_done:


bullets_hitboxes:
    

   lw $t0, 60($sp) ;#posX bull 1
   lw $t1, 64($sp)  ;#posY bull 1

bullet1_ovni1:
   lw $t2, 16($sp) ;#posX ovni1
   lw $t3, 20($sp) ;#posy ovni1

   li $t4, -1
   add $t4, $t4, $t3
   li $t5, 1
   add $t5, $t5, $t3

   beq $t0, $t2, check_bull_y
   j ovni1_bull_done

   check_bull_y:

   beq $t1, $t3, scoreup
   beq $t1, $t4, scoreup
   beq $t1, $t5, scoreup

   j ovni1_bull_done
scoreup:
   li $t2, -20
   sw $t2, 16($sp) ;#posX ovni1
   li $t2, -21
   sw $t2, 64($sp)

ovni1_bull_done:


bullet1_ovni2:
   lw $t2, 24($sp) ;#posX ovni1
   lw $t3, 28($sp) ;#posy ovni1

   li $t4, -1
   add $t4, $t4, $t3
   li $t5, 1
   add $t5, $t5, $t3

   beq $t0, $t2, check_bull_y2
   j ovni1_bull_done2

   check_bull_y2:

   beq $t1, $t3, scoreup2
   beq $t1, $t4, scoreup2
   beq $t1, $t5, scoreup2

   j ovni1_bull_done2
scoreup2:
   li $t2, -20
   sw $t2, 24($sp) ;#posX ovni1
   li $t2, -21
   sw $t2, 64($sp) ;#pos bullet1

ovni1_bull_done2:


bullet1_ovni3:
   lw $t2, 36($sp) ;#posX ovni1
   lw $t3, 40($sp) ;#posy ovni1

   li $t4, -1
   add $t4, $t4, $t3
   li $t5, 1
   add $t5, $t5, $t3

   beq $t0, $t2, check_bull_y3
   j ovni1_bull_done3

   check_bull_y3:

   beq $t1, $t3, scoreup3
   beq $t1, $t4, scoreup3
   beq $t1, $t5, scoreup3

   j ovni1_bull_done3
scoreup3:
   li $t2, -20
   sw $t2, 36($sp) ;#posX ovni1
   li $t2, -21
   sw $t2, 64($sp) ;#pos bullet1

ovni1_bull_done3:



bullet1_ovni4:
   lw $t2, 48($sp) ;#posX ovni1
   lw $t3, 52($sp) ;#posy ovni1

   li $t4, -1
   add $t4, $t4, $t3
   li $t5, 1
   add $t5, $t5, $t3

   beq $t0, $t2, check_bull_y4
   j ovni1_bull_done4

   check_bull_y4:

   beq $t1, $t3, scoreup4
   beq $t1, $t4, scoreup4
   beq $t1, $t5, scoreup4

   j ovni1_bull_done4
scoreup4:
   li $t2, -20
   sw $t2, 48($sp) ;#posX ovni1
   li $t2, -21
   sw $t2, 64($sp) ;#pos bullet1

ovni1_bull_done4:

;# 60,64, 72,76,  84,88, 96,100 bullets
    ;#16,20 24,28, 36,40, 48,52 ovnis
    ;#score 112
    
   lw $t0, 72($sp) ;#posX bull 1
   lw $t1, 76($sp)  ;#posY bull 1

bullet2_ovni:
   lw $t2, 16($sp) ;#posX ovni1
   lw $t3, 20($sp) ;#posy ovni1

   li $t4, -1
   add $t4, $t4, $t3
   li $t5, 1
   add $t5, $t5, $t3

   beq $t0, $t2, check_bull2_y
   j ovni1_bull2_done

   check_bull2_y:

   beq $t1, $t3, scoreup_bull2
   beq $t1, $t4, scoreup_bull2
   beq $t1, $t5, scoreup_bull2

   j ovni1_bull2_done
scoreup_bull2:
   li $t2, -20
   sw $t2, 16($sp) ;#posX ovni1
   li $t2, -21
   sw $t2, 76($sp) ;#pos bullet1

ovni1_bull2_done:



bullet2_ovni2:
   lw $t2, 24($sp) ;#posX ovni1
   lw $t3, 28($sp) ;#posy ovni1

   li $t4, -1
   add $t4, $t4, $t3
   li $t5, 1
   add $t5, $t5, $t3

   beq $t0, $t2, check_bull2_y2
   j ovni1_bull2_done2

   check_bull2_y2:

   beq $t1, $t3, scoreup2_bull2
   beq $t1, $t4, scoreup2_bull2
   beq $t1, $t5, scoreup2_bull2

   j ovni1_bull2_done2
scoreup2_bull2:
   li $t2, -20
   sw $t2, 24($sp) ;#posX ovni1
   li $t2, -21
   sw $t2, 76($sp) ;#pos bullet1

ovni1_bull2_done2:

bullet2_ovni3:
   lw $t2, 36($sp) ;#posX ovni1
   lw $t3, 40($sp) ;#posy ovni1

   li $t4, -1
   add $t4, $t4, $t3
   li $t5, 1
   add $t5, $t5, $t3

   beq $t0, $t2, check_bull2_y3
   j ovni1_bull2_done3

   check_bull2_y3:

   beq $t1, $t3, scoreup3_bull2
   beq $t1, $t4, scoreup3_bull2
   beq $t1, $t5, scoreup3_bull2

   j ovni1_bull2_done3
scoreup3_bull2:
   li $t2, -20
   sw $t2, 36($sp) ;#posX ovni1
   li $t2, -21
   sw $t2, 76($sp) ;#pos bullet1

ovni1_bull2_done3:



bullet2_ovni4:
   lw $t2, 48($sp) ;#posX ovni1
   lw $t3, 52($sp) ;#posy ovni1

   li $t4, -1
   add $t4, $t4, $t3
   li $t5, 1
   add $t5, $t5, $t3

   beq $t0, $t2, check_bull2_y4
   j ovni1_bull2_done4

   check_bull2_y4:

   beq $t1, $t3, scoreup4_bull2
   beq $t1, $t4, scoreup4_bull2
   beq $t1, $t5, scoreup4_bull2

   j ovni1_bull2_done4
scoreup4_bull2:
   li $t2, -20
   sw $t2, 36($sp) ;#posX ovni1
   li $t2, -21
   sw $t2, 76($sp) ;#pos bullet1

ovni1_bull2_done4:

    ;# 60,64, 72,76,  84,88, 96,100 bullets
    ;#16,20 24,28, 36,40, 48,52 ovnis
    ;#score 112

    

    
   lw $t0, 84($sp) ;#posX bull 1
   lw $t1, 88($sp)  ;#posY bull 1

bullet3_ovni:
   lw $t2, 16($sp) ;#posX ovni1
   lw $t3, 20($sp) ;#posy ovni1

   li $t4, -1
   add $t4, $t4, $t3
   li $t5, 1
   add $t5, $t5, $t3

   beq $t0, $t2, check_bull3_y
   j ovni1_bull3_done

   check_bull3_y:

   beq $t1, $t3, scoreup_bull3
   beq $t1, $t4, scoreup_bull3
   beq $t1, $t5, scoreup_bull3

   j ovni1_bull3_done
scoreup_bull3:
   li $t2, -20
   sw $t2, 16($sp) ;#posX ovni1
   li $t2, -21
   sw $t2, 88($sp) ;#pos bullet1

ovni1_bull3_done:

;# 60,64, 72,76,  84,88, 96,100 bullets
    ;#16,20 24,28, 36,40, 48,52 ovnis
    ;#score 112

bullet3_ovni2:
   lw $t2, 24($sp) ;#posX ovni1
   lw $t3, 28($sp) ;#posy ovni1

   li $t4, -1
   add $t4, $t4, $t3
   li $t5, 1
   add $t5, $t5, $t3

   beq $t0, $t2, check_bull3_y2
   j ovni1_bull3_done2

   check_bull3_y2:

   beq $t1, $t3, scoreup2_bull3
   beq $t1, $t4, scoreup2_bull3
   beq $t1, $t5, scoreup2_bull3

   j ovni1_bull3_done2
scoreup2_bull3:
   li $t2, -20
   sw $t2, 24($sp) ;#posX ovni1
   li $t2, -21
   sw $t2, 88($sp) ;#pos bullet1

ovni1_bull3_done2:


;# 60,64, 72,76,  84,88, 96,100 bullets
    ;#16,20 24,28, 36,40, 48,52 ovnis
    ;#score 112

bullet3_ovni3:
   lw $t2, 36($sp) ;#posX ovni1
   lw $t3, 40($sp) ;#posy ovni1

   li $t4, -1
   add $t4, $t4, $t3
   li $t5, 1
   add $t5, $t5, $t3

   beq $t0, $t2, check_bull3_y3
   j ovni1_bull3_done3

   check_bull3_y3:

   beq $t1, $t3, scoreup3_bull3
   beq $t1, $t4, scoreup3_bull3
   beq $t1, $t5, scoreup3_bull3

   j ovni1_bull3_done3
scoreup3_bull3:
   li $t2, -20
   sw $t2, 36($sp) ;#posX ovni1
   li $t2, -21
   sw $t2, 88($sp) ;#pos bullet1

ovni1_bull3_done3:

;# 60,64, 72,76,  84,88, 96,100 bullets
    ;#16,20 24,28, 36,40, 48,52 ovnis
    ;#score 112

bullet3_ovni4:
   lw $t2, 48($sp) ;#posX ovni1
   lw $t3, 52($sp) ;#posy ovni1

   li $t4, -1
   add $t4, $t4, $t3
   li $t5, 1
   add $t5, $t5, $t3

   beq $t0, $t2, check_bull3_y4
   j ovni1_bull3_done4

   check_bull3_y4:

   beq $t1, $t3, scoreup4_bull3
   beq $t1, $t4, scoreup4_bull3
   beq $t1, $t5, scoreup4_bull3

   j ovni1_bull3_done4
scoreup4_bull3:
   li $t2, -20
   sw $t2, 48($sp) ;#posX ovni1
   li $t2, -21
   sw $t2, 88($sp) ;#pos bullet1

ovni1_bull3_done4:

 ;# 60,64, 72,76,  84,88, 96,100 bullets
    ;#16,20 24,28, 36,40, 48,52 ovnis
    ;#score 112

    

    
   lw $t0, 96($sp) ;#posX bull 1
   lw $t1, 100($sp)  ;#posY bull 1

bullet4_ovni:
   lw $t2, 16($sp) ;#posX ovni1
   lw $t3, 20($sp) ;#posy ovni1

   li $t4, -1
   add $t4, $t4, $t3
   li $t5, 1
   add $t5, $t5, $t3

   beq $t0, $t2, check_bull4_y
   j ovni1_bull4_done

   check_bull4_y:

   beq $t1, $t3, scoreup_bull4
   beq $t1, $t4, scoreup_bull4
   beq $t1, $t5, scoreup_bull4

   j ovni1_bull4_done
scoreup_bull4:
   li $t2, -20
   sw $t2, 16($sp) ;#posX ovni1
   li $t2, -21
   sw $t2, 100($sp) ;#pos bullet1

ovni1_bull4_done:

;# 60,64, 72,76,  84,88, 96,100 bullets
    ;#16,20 24,28, 36,40, 48,52 ovnis
    ;#score 112

bullet4_ovni2:
   lw $t2, 24($sp) ;#posX ovni1
   lw $t3, 28($sp) ;#posy ovni1

   li $t4, -1
   add $t4, $t4, $t3
   li $t5, 1
   add $t5, $t5, $t3

   beq $t0, $t2, check_bull4_y2
   j ovni1_bull4_done2

   check_bull4_y2:

   beq $t1, $t3, scoreup2_bull4
   beq $t1, $t4, scoreup2_bull4
   beq $t1, $t5, scoreup2_bull4

   j ovni1_bull4_done2
scoreup2_bull4:
   li $t2, -20
   sw $t2, 24($sp) ;#posX ovni1
   li $t2, -21
   sw $t2, 100($sp) ;#pos bullet1

ovni1_bull4_done2:

;# 60,64, 72,76,  84,88, 96,100 bullets
    ;#16,20 24,28, 36,40, 48,52 ovnis
    ;#score 112

bullet4_ovni3:
   lw $t2, 36($sp) ;#posX ovni1
   lw $t3, 40($sp) ;#posy ovni1

   li $t4, -1
   add $t4, $t4, $t3
   li $t5, 1
   add $t5, $t5, $t3

   beq $t0, $t2, check_bull4_y3
   j ovni1_bull4_done3

   check_bull4_y3:

   beq $t1, $t3, scoreup3_bull4
   beq $t1, $t4, scoreup3_bull4
   beq $t1, $t5, scoreup3_bull4

   j ovni1_bull4_done3
scoreup3_bull4:
   li $t2, -20
   sw $t2, 36($sp) ;#posX ovni1
   li $t2, -21
   sw $t2, 100($sp) ;#pos bullet1

ovni1_bull4_done3:

   ;# 60,64, 72,76,  84,88, 96,100 bullets
    ;#16,20 24,28, 36,40, 48,52 ovnis
    ;#score 112

bullet4_ovni4:
   lw $t2, 48($sp) ;#posX ovni1
   lw $t3, 52($sp) ;#posy ovni1

   li $t4, -1
   add $t4, $t4, $t3
   li $t5, 1
   add $t5, $t5, $t3

   beq $t0, $t2, check_bull4_y4
   j ovni1_bull4_done4

   check_bull4_y4:

   beq $t1, $t3, scoreup4_bull4
   beq $t1, $t4, scoreup4_bull4
   beq $t1, $t5, scoreup4_bull4

   j ovni1_bull4_done4
scoreup4_bull4:
   li $t2, -20
   sw $t2, 48($sp) ;#posX ovni1
   li $t2, -21
   sw $t2, 100($sp) ;#pos bullet1

ovni1_bull4_done4:



j begin

j loop


game_over:

li $v0, 0
syscall