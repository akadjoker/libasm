global ft_strdup
extern ft_strlen
extern ft_strcpy
extern malloc

section .text

ft_strdup:
    call ft_strlen             ; call ft_strlen para obter o size da string
    inc rax                    ; Incrementa rax para incluir o terminador nulo
    push rdi                   ; Armazena rdi na pilha para preservar o ponteiro original
    mov rdi, rax               ; Passa o size da string (com o terminador) para rdi
    call malloc                ; call malloc para alocar memória para a nova string
    mov rdi, rax               ; Guarda o ponteiro retornado por malloc em rdi (destino da cópia)
    pop rsi                    ; Restaura o valor original de rdi (ponteiro da string original) em rsi
    call ft_strcpy              ; call ft_strcpy para copiar a string original para a nova memória
    ret                        ; Retorna o ponteiro para a nova string
