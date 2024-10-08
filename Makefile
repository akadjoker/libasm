NAME = libasm.a


#PATH
INCLUDE = ./includes
SRCPATH = ./src
OBJPATH = ./obj

NASM = nasm -felf64 
GCC = gcc -Wextra -Werror -Wall  -no-pie

#SRCS
SRCS = $(addprefix $(SRCPATH)/, ft_read.s ft_write.s ft_strlen.s ft_strcmp.s \
	   ft_strdup.s ft_strcpy.s)

#OBJS
OBJ = $(SRCS:$(SRCPATH)/%.s=$(OBJPATH)/%.o)

#RULES
all : MK_DIR $(NAME)

MK_DIR :
	@if [ ! -d $(OBJPATH) ]; then mkdir $(OBJPATH); fi

$(NAME) : $(OBJ)
	ar rcs $@ $(OBJ)

$(OBJPATH)/%.o : $(SRCPATH)/%.s $(INCLUDE)
	$(NASM) $< -o $@

test : all
	$(GCC) -I $(INCLUDE) main.c $(NAME) -o main
	./main

.PHONY : clean fclean re

clean :
	rm -rf $(OBJ)

fclean : clean
	rm -f $(NAME) main

re : fclean all
