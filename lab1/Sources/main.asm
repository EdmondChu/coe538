;**************************************************************
;* Demonstration Program                                      *
;* This program illustrates how to use the assembler.         *
;* It adds together two 8 bit numbers and leaves the result   *
;* in the ‘SUM’ location.                                     *
;* Author: Edmond Chu                                         *
;**************************************************************

; export symbols
            XDEF Entry, _Startup            ; export 'Entry' symbol
            ABSENTRY Entry        ; for absolute assembly: mark this as application entry point



; Include derivative-specific definitions 
		INCLUDE 'derivative.inc' 
;**************************************************************
;* Code Section                                               *
;**************************************************************
            ORG $3000
            
MULTIPLICAND    FCB $80   
MULTIPLIER      FCB $02
PRODUCT     RMB 2


            ORG   $4000
Entry:
_Startup:

          LDAA MULTIPLICAND ; Get the first number into ACCA
          LDAB MULTIPLIER ; Store multiplier to ACCB
          MUL  ; multiplies ACCA and ACCB
          STD PRODUCT ;stores ACCA then ACCB to PRODUCT
          SWI ; break to the monitor  
;**************************************************************
;*                 Interrupt Vectors                          *
;**************************************************************
            ORG   $FFFE
            FDB  Entry           ; Reset Vector
