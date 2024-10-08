
global ft_read
extern __errno_location
;default rel  ;relative position ?? desligado 
section .text

ft_read:
    mov rax, 0              ; Syscall ID para a function 'read' no Linux (ID = 0)
    syscall
    cmp rax, 0
    jl errcode              ; Se rax for negativo (erro), salta para o tratamento de erro
    ret                     ; Se não houver erro, retorna normalmente

errcode:                    ; Tratamento de erro
    neg rax
    mov r10, rax            ; Armazena o valor de erro em r10
    call __errno_location    ; Chama __errno_location para obter o endereço da variável errno
    mov [rax], r10          ; Coloca o número de erro em errno
    mov rax, -1             ; Define o valor de retorno como -1 (indica erro)
    ret                     ; return  -1
