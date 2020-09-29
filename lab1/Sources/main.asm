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
            
FIRSTNUM    FCB $0A   
SECNUM      FCB $FF
PRODUCT     RMB 2


            ORG   $4000
Entry:
_Startup:

          LDAA FIRSTNUM ; Get the first number into ACCA
          ADDA SECNUM ; Add to it the second number
          STAA PRODUCT ; and store the sum
          SWI ; break to the monitor  
;**************************************************************
;*                 Interrupt Vectors                          *
;**************************************************************
            ORG   $FFFE
            FDB  Entry           ; Reset Vector
