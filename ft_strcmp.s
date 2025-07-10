section .text
    global ft_strcmp

ft_strcmp:
.loop:
    mov     al, [rdi]
    mov     bl, [rsi]
    cmp     al, bl
    jg      .greater
    jl      .less
    test    al, al
    jz      .equal
    inc     rsi
    inc     rdi
    jmp     .loop
.equal
    mov   rax, 0
    ret 
.greater
    mov   rax, 1
    ret
.less
    mov   rax, -1
    ret