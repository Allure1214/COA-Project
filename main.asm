INCLUDE Irvine32.inc

.DATA
    msg1        BYTE "Enter first number: ", 0
    msg2        BYTE "Enter second number: ", 0
    msg3        BYTE "Enter third number: ", 0
    resultMsg   BYTE "The average is: ", 0
    exitMsg     BYTE "Press 'q' to quit or any key to continue: ", 0
    separator   BYTE "---------------------------------------", 0

    num1        SDWORD ?
    num2        SDWORD ?
    num3        SDWORD ?
    avg         REAL8 ?
    three       REAL8 3.0
    hundred     REAL8 100.0
    roundedInt  SDWORD ?
    wholePart   SDWORD ?
    decimalPart SDWORD ?

.CODE
main PROC
startLoop:
    ; Print separator
    call Crlf
    mov edx, OFFSET separator
    call WriteString
    call Crlf

    ; Get user inputs
    call Crlf
    mov edx, OFFSET msg1
    call WriteString
    call ReadInt
    mov num1, eax

    call Crlf
    mov edx, OFFSET msg2
    call WriteString
    call ReadInt
    mov num2, eax

    call Crlf
    mov edx, OFFSET msg3
    call WriteString
    call ReadInt
    mov num3, eax

    ; Calculate average = (num1 + num2 + num3) / 3.0
    finit               ; Clear FPU stack just in case
    fild num1
    fild num2
    fadd
    fild num3
    fadd
    fld three
    fdiv
    fstp avg            ; Store and pop the result

    ; Convert avg to integer * 100 and round it
    fld avg
    fld hundred
    fmul
    fistp roundedInt

    ; Split into whole and decimal parts
    mov eax, roundedInt
    cdq
    mov ebx, 100
    idiv ebx
    mov wholePart, eax
    mov decimalPart, edx

    ; Make decimal part positive
    cmp edx, 0
    jge skipNegate
    neg edx
skipNegate:
    mov decimalPart, edx

    ; Display result
    call Crlf
    mov edx, OFFSET resultMsg
    call WriteString

    mov eax, wholePart
    call WriteDec         ; Use WriteDec to avoid + sign

    mov al, '.'
    call WriteChar

    mov eax, decimalPart
    cmp eax, 10
    jae skipLeadingZero
    mov al, '0'
    call WriteChar
skipLeadingZero:
    mov eax, decimalPart
    call WriteDec         ; Use WriteDec to avoid + sign
    call Crlf

    ; Print separator again
    call Crlf
    mov edx, OFFSET separator
    call WriteString
    call Crlf

    ; Ask for quit or continue
    call Crlf
    mov edx, OFFSET exitMsg
    call WriteString
    call ReadChar
    cmp al, 'q'
    je exitProgram
    jmp startLoop

exitProgram:
    call Crlf
    exit
main ENDP

END main
