INCLUDE "game/src/common/constants.asm"

SECTION "Clear Memory", ROM0[$15EE]
memclr::
  xor a
  ld [hli], a
  dec bc
  ld a, b
  or c
  jr nz, memclr
  ret

SECTION "Copy Memory", ROM0[$0EDD]
;Copy bc bytes from [hl] to [de].
memcpy::
  ld a, [hli]
  ld [de], a
  inc de
  dec bc
  ld a, b
  or c
  jr nz, memcpy
  ret
