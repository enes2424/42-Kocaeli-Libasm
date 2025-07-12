section .text
    global ft_list_sort

ft_list_sort:
.start:
    mov     r9, 0
    mov     rax, [rdi]
    mov     rcx, [rax + 8]
    test    rcx, rcx
    jz      .done
    push    rdi
    mov     rdi, [rax]
    mov     rdx, rsi
    push    rsi
    mov     rsi, [rcx]
    push    r9
    call    rdx
    pop     r9
    pop     rsi
    pop     rdi
    cmp     rax, 0
    jg     .swap
    mov     rax, [rdi]
    mov     rcx, [rax + 8]
    mov     rdx, [rcx + 8]

.loop:
    test    rdx, rdx
    jz      .done
    push    rax
    push    rdi
    mov     rdi, [rcx]
    mov     r8, rsi
    push    rsi
    mov     rsi, [rdx]
    push    r9
    call    r8
    pop     r9
    pop     rsi
    pop     rdi
    cmp     rax, 0
    jg     .swap2
    pop     rax
    mov     rax, [rax + 8]
    mov     rcx, [rax + 8]
    mov     rdx, [rcx + 8]
    jmp    .loop

.done:
    cmp     r9, 1
    je      .start
    ret

.swap:
    mov     r9, 1
    mov     rax, [rdi]
    mov     rcx, [rax + 8]
    mov     rdx, [rcx + 8]
    mov     [rax + 8], rdx
    mov     [rcx + 8], rax
    mov     [rdi], rcx
    mov     rax, [rdi]
    mov     rcx, [rax + 8]
    jmp     .loop

.swap2:
    mov     r9, 1
    pop     rax
    mov     rcx, [rax + 8]
    mov     rdx, [rcx + 8]
    mov     r8, [rdx + 8]
    mov     [rax + 8], rdx
    mov     [rdx + 8], rcx
    mov     [rcx + 8], r8
    mov     rax, rdx
    mov     rdx, r8
    jmp     .loop
