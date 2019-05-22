# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vdarmaya <vdarmaya@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/05/14 18:51:58 by vdarmaya          #+#    #+#              #
#    Updated: 2019/05/16 19:05:42 by vdarmaya         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SERVER	= server
CLIENT	= client

CC		= gcc
FLAGS	= -Wall -Wextra -Werror

SERVER_SRCS_FILES	=	server.c			\
						server_pi.c			\
						server_pi_utils.c	\
						server_init.c		\
						server_utils.c		\
						command_pwd.c		\
						command_cd.c		\
						command_cd_utils.c	\
						command_del.c		\
						command_get.c		\
						command_put.c
CLIENT_SRCS_FILES	=	client.c			\
						client_pi.c			\
						client_dtp.c		\
						lcommand_cd.c		\
						lcommand_cd_utils.c	\
						lcommand_put.c

SERVER_HEADERS_FILES	=	server.h
CLIENT_HEADERS_FILES	=	client.h

SERVER_PATH	= sources/server/
CLIENT_PATH	= sources/client/

SERVER_SRCS	= $(addprefix $(SERVER_PATH), $(SERVER_SRCS_FILES))
CLIENT_SRCS	= $(addprefix $(CLIENT_PATH), $(CLIENT_SRCS_FILES))

OBJS_PATH			= objs/
SERVER_OBJS_PATH	= objs/server/
CLIENT_OBJS_PATH	= objs/client/
SERVER_OBJS			= $(addprefix $(SERVER_OBJS_PATH), $(SERVER_SRCS_FILES:.c=.o))
CLIENT_OBJS 		= $(addprefix $(CLIENT_OBJS_PATH), $(CLIENT_SRCS_FILES:.c=.o))

INCLUDES_PATH	= includes/
INCLUDES		= -I $(INCLUDES_PATH)
SERVER_HEADERS	= $(addprefix $(INCLUDES_PATH), $(SERVER_HEADERS_FILES))
CLIENT_HEADERS	= $(addprefix $(INCLUDES_PATH), $(CLIENT_HEADERS_FILES))

LIBFT_PATH		= libft/
LIBFT_INCLUDES	= -I libft/includes
LIBFT			= -L $(LIBFT_PATH) -lft

all: libft server_msg $(SERVER) client_msg $(CLIENT)

libft:
	@make -C $(LIBFT_PATH)

$(SERVER_OBJS_PATH)%.o: $(SERVER_PATH)%.c $(SERVER_HEADERS) $(LIBFT_PATH)libft.a
	@ /bin/echo -n "	$(notdir $@)"
	@mkdir $(OBJS_PATH) 2> /dev/null || true
	@mkdir $(SERVER_OBJS_PATH) 2> /dev/null || true
	@ $(CC) $(FLAGS) $(INCLUDES) $(LIBFT_INCLUDES) -o $@ -c $<
	@ echo " \033[32mOK\033[0m"

$(CLIENT_OBJS_PATH)%.o: $(CLIENT_PATH)%.c $(CLIENT_HEADERS) $(LIBFT_PATH)libft.a
	@ /bin/echo -n "	$(notdir $@)"
	@mkdir $(OBJS_PATH) 2> /dev/null || true
	@mkdir $(CLIENT_OBJS_PATH) 2> /dev/null || true
	@ $(CC) $(FLAGS) $(INCLUDES) $(LIBFT_INCLUDES) -o $@ -c $<
	@ echo " \033[32mOK\033[0m"

$(SERVER): $(SERVER_OBJS)
	@ /bin/echo -n "Archiving objects in $(SERVER):"
	@$(CC) $(FLAGS) $(LIBFT) $(SERVER_OBJS) -o $@
	@ echo " \033[32mdone\033[0m"

$(CLIENT): $(CLIENT_OBJS)
	@ /bin/echo -n "Archiving objects in $(CLIENT):"
	@$(CC) $(FLAGS) $(LIBFT) $(CLIENT_OBJS) -o $@
	@ echo " \033[32mAll done!\033[0m"

clean:
	@make fclean -C $(LIBFT_PATH)
	@ /bin/echo -n "Removing object files:"
	@rm -rf $(OBJS_PATH)
	@ echo " \033[32mdone\033[0m"

fclean: clean
	@make clean -C $(LIBFT_PATH)
	@ /bin/echo -n "Removing binary:"
	@rm -f $(SERVER) $(CLIENT)
	@ echo " \033[32mdone\033[0m"

server_msg:
	@echo "  server files:"

client_msg:
	@echo "  client files:"

re: fclean all

.PHONY: all libft clean fclean  server_msg client_msg re
