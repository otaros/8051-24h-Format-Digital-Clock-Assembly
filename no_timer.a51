
      ; Reset Vector
      org   0000h
      jmp   Start

;====================================================================
; CODE SEGMENT
;====================================================================

      org   0100h

Start:
;preset time
	MOV R0,#00d
	MOV R1,#05d
	MOV R2,#03d
	MOV R3,#02d
	
	MOV R5,#0d
	MOV R6,#0d
	MOV A,#0d
Loop:
	CALL SHOW
	CJNE R5,#256d,Loop
	CALL IN_R6
	MOV R5,#0d
	CJNE R6,#8d,Loop
	CALL IN_A
	MOV R6,#0d
	CJNE A,#60d,Loop
	MOV A,#0d
	CALL INCREASING
	jmp loop
	
SHOW:
	MOV P2,R0
	MOV P3,#08h
	CALL DELAY
	INC R5
	MOV P3,#00h
	
		  
	MOV P2,R1
	MOV P3,#04h
	CALL DELAY
	INC R5
	MOV P3,#00h

		  
	MOV P2,R2
	MOV P3,#02h
	CALL DELAY
	INC R5
	MOV P3,#00h

		  
	MOV P2,R3
	MOV P3,#01h
	CALL DELAY
	INC R5
	MOV P3,#00h

	RET
	
DELAY:
	MOV R7,#237d
AGAIN:
	DJNZ R7,AGAIN
	RET
      
INCREASING:
	CJNE R3,#2d,WhenHoursIs1x
	;MOV R6,#0d
	CJNE R0,#09d,IN_R0
	MOV R0,#0d
	CJNE R1,#05d,IN_R1
	MOV R1,#0d
	CJNE R2,#03d,IN_R2
	MOV R2,#0d
	MOV R3,#0d
	RET
WhenHoursIs1x:
	;MOV R6,#0d
	CJNE R0,#09d,IN_R0
	MOV R0,#0d
	CJNE R1,#05d,IN_R1
	MOV R1,#0d
	CJNE R2,#09d,IN_R2
	MOV R2,#0d
	CJNE R3,#02d,IN_R3
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
IN_R6:
	INC R6
	RET
IN_A:
	INC A
	RET
end