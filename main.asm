INCLUDE Irvine32.inc

.DATA
    msg1    BYTE "Enter first number: ", 0
    msg2    BYTE "Enter second number: ", 0
    msg3    BYTE "Enter third number: ", 0
    resultMsg BYTE "The average is: ", 0
    exitMsg BYTE "Press 'q' to quit or any key to continue: ", 0
    separator BYTE "---------------------------------------", 0
    num1    SDWORD ?
    num2    SDWORD ?
    num3    SDWORD ?
    avg     REAL8 ?   
    three   REAL8 3.0 
    roundedAvg SDWORD ?   ; Store integer rounded average

.CODE
main PROC
startLoop:
    ; Print separator line
    call Crlf
    mov edx, OFFSET separator
    call WriteString
    call Crlf

    ; Get user input
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

    ; Convert integers to floating-point and calculate average
    fild num1       
    fild num2       
    fadd           
    fild num3       
    fadd            

    fld three       
    fdiv            

    ; Round the floating-point number to nearest integer
    fistp roundedAvg  

    ; Display result as integer
    call Crlf
    mov edx, OFFSET resultMsg
    call WriteString
    mov eax, roundedAvg
    call WriteInt
    call Crlf

    ; Print separator line
    call Crlf
    mov edx, OFFSET separator
    call WriteString
    call Crlf

    ; Ask if user wants to continue or quit
    call Crlf
    mov edx, OFFSET exitMsg
    call WriteString
    call ReadChar
    cmp al, 'q'
    je exitProgram
    call Crlf
    jmp startLoop

exitProgram:
    call Crlf
    exit
main ENDP

END main
