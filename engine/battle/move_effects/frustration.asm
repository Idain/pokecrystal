BattleCommand_FrustrationPower:
; frustrationpower

	push bc
	ld hl, wBattleMonHappiness
	ldh a, [hBattleTurn]
	and a
	jr z, .got_happiness
	ld hl, wEnemyMonHappiness
.got_happiness
	ld a, $ff
	sub [hl]
	ldh [hMultiplicand + 2], a
	xor a
	ldh [hMultiplicand + 0], a
	ldh [hMultiplicand + 1], a
	ld a, 10
	ldh [hMultiplier], a
	call Multiply
	ld a, 25
	ldh [hDivisor], a
	ld b, 4
	call Divide
	ldh a, [hQuotient + 3]
	and a
	jr nz, .calc_done
	inc a ; At least 1 Power
.calc_done
	ld d, a
	pop bc
	ret
