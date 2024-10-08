#include "libasm.h"
#include <assert.h>
#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>

void test_ft_strlen()
{
	assert(ft_strlen("hello") == strlen("hello"));
	assert(ft_strlen("") == strlen(""));
	assert(ft_strlen("1234567890") == strlen("1234567890"));
	assert(ft_strlen("abcdefghijklmnopqrstuvwxyz") == strlen("abcdefghijklmnopqrstuvwxyz"));
	assert(ft_strlen("1234567890abcdefghijklmnopqrstuvwxyz") == strlen("1234567890abcdefghijklmnopqrstuvwxyz"));
	assert(ft_strlen("1234567890abcdefghijklmnopqrstuvwxyz1234567890") == strlen("1234567890abcdefghijklmnopqrstuvwxyz1234567890"));
	printf("ft_strlen: Todos os testes passaram.\n");
}

void test_ft_strcpy()
{
	char dest[128];

	assert(strcmp(ft_strcpy(dest, "hello"), "hello") == 0);
	assert(strcmp(ft_strcpy(dest, ""), "") == 0);
	assert(strcmp(ft_strcpy(dest, "1234567890"), "1234567890") == 0);
	assert(strcmp(ft_strcpy(dest, "abcdefghijklmnopqrstuvwxyz"), "abcdefghijklmnopqrstuvwxyz") == 0);
	assert(strcmp(ft_strcpy(dest, "1234567890abcdefghijklmnopqrstuvwxyz"), "1234567890abcdefghijklmnopqrstuvwxyz") == 0);
	assert(strcmp(ft_strcpy(dest, "1234567890abcdefghijklmnopqrstuvwxyz1234567890"), "1234567890abcdefghijklmnopqrstuvwxyz1234567890") == 0);

	printf("ft_strcpy: Todos os testes passaram.\n");
}

void test_ft_strcmp()
{
	assert(ft_strcmp("abc", "abc") == strcmp("abc", "abc"));
	assert(ft_strcmp("abc", "abd") == strcmp("abc", "abd"));
	assert(ft_strcmp("abd", "abc") == strcmp("abd", "abc"));
	printf("ft_strcmp: Todos os testes passaram.\n");
}

void test_ft_strdup(void)
{
	char *src = "Libasm é fixe!";
	char *dup;

	dup = ft_strdup(src);

	if (dup == NULL)
	{
		printf("Erro: ft_strdup retornou NULL\n");
		return;
	}

	// Verifica se a string duplicada é igual à original
	if (strcmp(src, dup) == 0)
		printf("ft_strdup passou: A string foi duplicada corretamente.\n");
	else
		printf("ft_strdup falhou: A string duplicada é diferente da original.\n");

	free(dup);
}

void test_ft_write()
{
	ssize_t ret;
	const char *msg = "Teste de ft_write\n";

	
	ret = ft_write(1, msg, 18); // 1 = stdout
	if (ret == -1)
		perror("Erro ao escrever para stdout");
	else
		printf("ft_write: Escreveu %zd bytes para stdout\n", ret);


	int fd = open("teste.txt", O_WRONLY | O_CREAT | O_TRUNC, 0644);
	if (fd < 0)
	{
		perror("Erro ao abrir o ficheiro");
		return;
	}

	ret = ft_write(fd, msg, 18); // Escreve no ficheiro
	if (ret == -1)
		perror("Erro ao escrever no ficheiro");
	else
		printf("ft_write: Escreveu %zd bytes no ficheiro\n", ret);

	close(fd);
}
void test_ft_read()
{
	ssize_t ret;
	char buffer[100];

	printf("\n....................................\n");
	printf("Digite algo para testar ft_read: \n");
	ret = ft_read(0, buffer, 100); // 0 = stdin
	if (ret == -1)
		perror("Erro ao ler do stdin");
	else
	{
		buffer[ret] = '\0';
		printf("ft_read: Leu %zd bytes do stdin: %s\n", ret, buffer);
	}

	int fd = open("teste.txt", O_RDONLY);
	if (fd < 0)
	{
		perror("Erro ao abrir o ficheiro para leitura");
		return;
	}

	ret = ft_read(fd, buffer, 100); // Le do ficheiro
	if (ret == -1)
		perror("Erro ao ler do ficheiro");
	else
	{
		buffer[ret] = '\0'; 
		printf("ft_read: Leu %zd bytes do ficheiro: %s\n", ret, buffer);
	}

	close(fd);
}

int main()
{

	printf("Iniciando testes...\n\n");
	printf("Iniciando ft_strlen...\n");
	test_ft_strlen();
	printf("Iniciando ft_strcpy...\n");
	test_ft_strcpy();
	printf("Iniciando ft_strcmp...\n");
	test_ft_strcmp();
	printf("Iniciando ft_strdup...\n");
	test_ft_strdup();

	printf("Iniciando ft_write...\n");
	test_ft_write();

	printf("Iniciando ft_read...\n");
	test_ft_read();


	printf("Todos os testes passaram.\n");

	return 0;
}
