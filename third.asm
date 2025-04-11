section .text
    global main
    extern printf
    extern scanf

countEvenDigits:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    
    ; num is in edi
    mov eax, edi        ; eax = num
    cdq                 ; sign extend eax to edx:eax for abs
    xor eax, edx
    sub eax, edx        ; eax = abs(num)
    
    mov ecx, 0          ; count = 0
    
.count_loop:
    mov edx, 0
    mov ebx, 10
    div ebx             ; edx = num % 10, eax = num / 10
    
    test edx, 1         ; check if digit is even
    jnz .not_even
    inc ecx             ; count++ if even
    
.not_even:
    test eax, eax       ; while (num != 0)
    jnz .count_loop
    
    mov eax, ecx        ; return count
    leave
    ret

main:
    push rbp
    mov rbp, rsp
    sub rsp, 32         ; allocate space for variables
    
    lea rdi, [rel format_input]
    lea rsi, [rsp+16]   ; &num
    call scanf
    
    cmp eax, 1
    jne .end
    
    mov edi, [rsp+16]   ; load num
    call countEvenDigits
    
    ; print first result
    lea rdi, [rel format_output]
    mov esi, eax
    call printf
    
.read_loop:
    lea rdi, [rel format_input]
    lea rsi, [rsp+16]   ; &num
    call scanf
    
    cmp eax, 1
    jne .end
    
    ; print space
    lea rdi, [rel space]
    call printf
    
    mov edi, [rsp+16]   ; load num
    call countEvenDigits
    
    ; print count
    lea rdi, [rel format_output]
    mov esi, eax
    call printf
    
    jmp .read_loop
    
.end:
    xor eax, eax        ; return 0
    leave
    ret

section .data
    format_input db "%d", 0
    format_output db "%d", 0
    space db " ", 0