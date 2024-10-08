global ft_write
extern __errno_location

section .text

ft_write:
    mov rax, 1              ; Syscall ID para a function 'write' no Linux (ID = 1)
    syscall
    cmp rax, 0
    jl errcode              ; Se rax for negativo (erro), salta para o tratamento de erro
    ret                     ; Se não houver erro, retorna normalmente

errcode:                    ; Tratamento de erro
    neg rax
    mov r10, rax            ; Armazena o valor de erro em r10
    call __errno_location    ; Chama __errno_location para obter o endereço da var  errno
    mov [rax], r10          ; Coloca o numero de erro em errno
    mov rax, -1             ; Define o valor de retorno como -1 (indica erro)
    ret                     ; Retorna -1
