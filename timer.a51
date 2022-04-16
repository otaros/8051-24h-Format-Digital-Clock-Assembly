
      ; Reset Vector
      org   0000h
      jmp   Start

;====================================================================
; CODE SEGMENT
;====================================================================

      org   0100h

Start:
;preset time
      MOV R0,#08d
      MOV R1,#05d
      MOV R2,#03d
      MOV R3,#02d
      
      MOV R5,#0d
      MOV R6,#0d
      MOV TMOD, #20h
      MOV TH1,#05h
      MOV TL1,#05h
      SETB TR1
Loop:
      CALL SHOW
      CALL CHECKING_CONDITION
      jmp Loop
      

DELAY:      
      MOV 8AH, #LOW(50536)
      MOV 8CH, #HIGH(50536)
      MOV TMOD,#21H
      SETB 8CH
AGAIN:
      JNB 8DH, AGAIN
      CLR 8DH
      CLR 8CH
      RET
      
CHECKING_CONDITION:
      JBC 8FH,STEP
      RET
STEP:
      INC R5
      CJNE R5,#16d,SKIP_STEP
      INC R6
      MOV R5,#0d
      CJNE R6,#62d,SKIP_STEP
      JMP INCREASING
SKIP_STEP:
      RET
      
INCREASING:
      CJNE R3,#2d,WhenHoursIs1x
      MOV R6,#0d
      CJNE R0,#09d,IN_R0
      MOV R0,#0d
      CJNE R1,#05d,IN_R1
      MOV R1,#0d
      CJNE R2,#03d,IN_R2
      MOV R2,#0d
      MOV R3,#0d
      RET
WhenHoursIs1x:
      MOV R6,#0d
      CJNE R0,#09d,IN_R0
      MOV R0,#0d
      CJNE R1,#05d,IN_R1
      MOV R1,#0d
      CJNE R2,#09d,IN_R2
      MOV R2,#0d
      CJNE R3,#02d,IN_R3
      RET
      
SHOW:
      MOV P2,R0
      MOV P3,#08h
      CALL DELAY
      MOV P3,#00h

      
      MOV P2,R1
      MOV P3,#04h
      CALL DELAY
      MOV P3,#00h

      
      MOV P2,R2
      MOV P3,#02h
      CALL DELAY
      MOV P3,#00h

      
      MOV P2,R3
      MOV P3,#01h
      CALL DELAY
      MOV P3,#00h

      RET
	  
IN_R0:
      INC R0
      RET
IN_R1:
      INC R1
      RET
IN_R2:
      INC R2
      RET
IN_R3:
      INC R3
      RET

;====================================================================
      END