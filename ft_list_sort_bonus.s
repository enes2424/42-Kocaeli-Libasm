section .text
    global ft_list_sort

ft_swap_with_next_node:
    mov     rcx, [rsi + 8]
    mov     rdx, [rcx + 8]
    mov     [rsi + 8], rdx
    mov     [rcx + 8], rsi
    mov     r8, [rdi]
    mov     [r8 + 8], rcx
    ret

ft_list_sort:
    push    rsi
    mov     rsi, [rdi]
    mov     rsi, [rsi + 8]
    call    ft_swap_with_next_node
    pop     rsi
    ret