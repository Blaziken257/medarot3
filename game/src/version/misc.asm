; Miscellaneous functions that belong elsewhere but are in different spots in different versions
INCLUDE "game/src/common/constants.asm"
INCLUDE "game/src/common/macros.asm"

INCLUDE "build/pointer_constants.asm"

IF !STRCMP("{GAMEVERSION}", "kabuto")
SECTION "Load numbers into buffer for text", ROMX[$56a8], BANK[$09]
ENDC
IF !STRCMP("{GAMEVERSION}", "kuwagata")
SECTION "Load numbers into buffer for text", ROMX[$56a7], BANK[$09]
ENDC
TextLoadNumberIntoBuffer::
  ld bc, $3e8
  call DigitCalculationLoop
  ld a, [$c4ee]
  ld [$c4f2], a
  ld a, [$c4e1]
  ld l, a
  ld a, [$c4e0]
  ld h, a
  ld bc, $64
  call DigitCalculationLoop
  ld a, [$c4ee]
  ld [$c4f3], a
  ld a, [$c4e1]
  ld l, a
  ld a, [$c4e0]
  ld h, a
  ld bc, $a
  call DigitCalculationLoop
  ld a, [$c4ee]
  ld [$c4f4], a
  ld a, [$c4e1]
  ld [$c4f5], a
  ld c, $03
  ld de, $c4f2
  ld hl, cBUF06
.loop_digit_1
  ld a, [de]
  or a
  jr nz, .loop_digit_2
  inc de
  dec c
  jr nz, .loop_digit_1
  jr .return
.loop_digit_2
  ld a, [de]
  inc de
  add $e0
  ld [hli], a
  dec c
  jr nz, .loop_digit_2
.return
  ld a, [de]
  inc de
  add $e0
  ld [hli], a
  ld a, $cb
  ld [hl], a
  ret