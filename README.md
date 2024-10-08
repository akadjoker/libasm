
# Projeto Libasm - README

Este projeto implementa funções da biblioteca padrão em Assembly x86_64. Abaixo está uma descrição dos principais registradores utilizados no código, bem como suas funções dentro do contexto das funções implementadas.

## Registradores Utilizados no Código:

1. **`rax`**
   - **Função**: Registrador de retorno principal. Usado para armazenar o resultado de funções e syscalls. Também é usado para passar o número da syscall em chamadas ao sistema.
   - **Exemplos**:
     - Em **`ft_write`** e **`ft_read`**, **`rax`** é configurado com o ID da syscall e também armazena o número de bytes escritos ou lidos.
     - Em **`ft_strlen`**, **`rax`** contém o comprimento da string.
     - Em **`ft_strdup`**, **`rax`** contém o ponteiro retornado por `malloc`.

2. **`rdi`**
   - **Função**: Contém o **primeiro argumento** passado para funções. Em chamadas ao sistema, **`rdi`** armazena o **primeiro argumento**, como o **file descriptor** para `write` e `read`.
   - **Exemplos**:
     - Em **`ft_strlen`** e **`ft_strcpy`**, **`rdi`** armazena o ponteiro da string de destino.
     - Em syscalls, **`rdi`** armazena o file descriptor (por exemplo, 1 para `stdout`).

3. **`rsi`**
   - **Função**: Usado para o **segundo argumento** de funções. Para operações de manipulação de strings, **`rsi`** contém o ponteiro para a string de origem.
   - **Exemplos**:
     - Em **`ft_strcpy`**, **`rsi`** contém o ponteiro para a string de origem que será copiada.
     - Em syscalls como `write`, **`rsi`** contém o ponteiro para o buffer que será escrito.

4. **`rdx`**
   - **Função**: Contém o **terceiro argumento** de funções e syscalls. Em operações de leitura e escrita, **`rdx`** armazena o número de bytes a serem processados.
   - **Exemplos**:
     - Em **`ft_strcmp`**, **`rdx`** armazena o caractere atual da string de origem durante a comparação.
     - Em syscalls como `write` e `read`, **`rdx`** contém o tamanho do buffer (número de bytes a processar).

5. **`rcx`**
   - **Função**: Usado como **índice** para percorrer strings em funções como **`ft_strcmp`**.
   - **Exemplo**:
     - Em **`ft_strcmp`**, **`rcx`** é incrementado a cada caractere processado.

6. **`r10`**
   - **Função**: Usado como registrador temporário para armazenar valores intermediários, como códigos de erro.
   - **Exemplo**:
     - Em **`ft_write`** e **`ft_read`**, **`r10`** armazena o código de erro antes de ser transferido para **errno**.

7. **`r8`**
   - **Função**: Usado para armazenar resultados intermediários, como o valor da subtração em **`ft_strcmp`**.
   - **Exemplo**:
     - Em **`ft_strcmp`**, **`r8`** armazena a diferença entre os caracteres das strings comparadas.

8. **`r11`**
   - **Função**: Utilizado em **`ft_strcpy`** para armazenar o **caractere atual** da string de origem antes de copiá-lo para a string de destino.
   - **Exemplo**:
     - Em **`ft_strcpy`**, **`r11b`** contém o caractere atual da string de origem.

9. **`al`**
   - **Função**: Sub-registro de **`rax`** (8 bits), usado para operações byte a byte, como comparar caracteres em **`ft_strlen`**.
   - **Exemplo**:
     - Em **`ft_strlen`**, **`al`** armazena o caractere atual durante a contagem dos caracteres da string.

10. **`dl`**
    - **Função**: Sub-registro de **`rdx`** (8 bits), usado para armazenar caracteres em comparações.
    - **Exemplo**:
      - Em **`ft_strcmp`**, **`dl`** contém o caractere atual da segunda string durante a comparação.

## Como Usar os Registradores no Projeto:

- **Argumentos das Funções**: Os registradores **`rdi`**, **`rsi`**, e **`rdx`** são usados para passar os três primeiros argumentos em chamadas de função. Isso é particularmente útil em funções como **`ft_strcpy`** e **`ft_strlen`**, onde esses registradores contêm os ponteiros para as strings de origem e destino.
  
- **Syscalls**: Para chamadas ao sistema, como `write` e `read`, os registradores **`rdi`**, **`rsi`**, e **`rdx`** passam o file descriptor, o buffer, e o número de bytes a processar, enquanto **`rax`** armazena o ID da syscall e o valor de retorno.

- **Índice e Comparação**: Em funções de manipulação de strings, como **`ft_strcmp`**, **`rcx`** é usado como índice para percorrer as strings, e os sub-registradores como **`al`** e **`dl`** são usados para operações de comparação byte a byte.

Este README detalha os principais registradores usados no projeto e como eles são utilizados em funções de manipulação de strings e chamadas ao sistema.
