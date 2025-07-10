section .text
    global ft_strcpy

ft_strcpy:
    mov     rax, rdi
.loop:
    mov     al, [rsi]
    test    al, al
    jz      .done
    mov     [rdi], al
    inc     rsi
    inc     rdi
    jmp     .loop
.done:
    mov     byte [rdi], 0
    ret