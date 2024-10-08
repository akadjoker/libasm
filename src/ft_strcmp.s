global ft_strcmp

section .text

ft_strcmp:
    xor rcx, rcx            ; Zera o contador de index (rcx = 0)
    xor rdx, rdx            ; Zera rdx, que armazenará o caractere da string 2
    xor r8, r8              ; Zera r8, que será usado para o valor de retorno
p1:
    mov dl, byte[rsi + rcx] ; Carrega o caractere atual da string 2 (rsi) para dl
    cmp dl, 0               ; Verifica se é o fim da string (terminador nulo)
    je exit                 ; Se for o fim da string, salta para o fim
    cmp byte[rdi + rcx], 0  ; Verifica se a string 1 (rdi) chegou ao fim
    je exit                 ; Se a string 1 terminou, salta para o fim
    cmp byte[rdi + rcx], dl ; Compara os caracteres das duas strings
    jne exit                ; Se forem diferentes, termina a comparação
    inc rcx                 ; Incrementa o index para o próximo caractere
    jmp p1                  ; Continua a comparação no próximo caractere
exit:
    mov r8b, byte[rdi + rcx] ; Carrega o caractere da string 1 para r8b
    sub r8, rdx              ; Subtrai o caractere da string 2 do caractere da string 1
    mov rax, r8              ; Armazena o resultado da subtração em rax (valor de retorno)
    ret                      ; Retorna o resultado

