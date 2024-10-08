global ft_strcpy

section .text

ft_strcpy:
    mov r10, -1             ; Inicializa r10 com -1 (usado como índice)
s1:
    inc r10                 ; Incrementa r10 (primeiro incremento torna r10 = 0)
    cmp byte[rsi + r10], 0  ; Compara o char atual da string de origem (rsi) com '\0'
    je s2                   ; Se for o terminador nulo, salta para s2 (fim da cópia)
    mov r11b, byte[rsi + r10] ; Carrega o char atual da origem (rsi) em r11b
    mov byte[rdi + r10], r11b ; Copia o char da origem para o destino (rdi)
    jmp s1                  ; Continua a copia com o proximo char
s2:
    mov byte[rdi + r10], 0x0 ; Insere o terminador nulo no fim da string de destino
    mov rax, rdi            ; Coloca o ponteiro de destino em rax (valor de retorno)
    ret                     ; Retorna o ponteiro de destino
