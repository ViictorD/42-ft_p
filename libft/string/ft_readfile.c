/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_readfile.c                                      :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: vdarmaya <vdarmaya@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/05/14 15:50:21 by vdarmaya          #+#    #+#             */
/*   Updated: 2019/05/14 15:50:57 by vdarmaya         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "string.h"

size_t	ft_readfile(const int fd, char **buf)
{
	char	buff[1024];
	char	*dup;
	char	*tmp;
	int		ret;
	size_t	len;

	dup = ft_strnew(0);
	len = 0;
	while ((ret = read(fd, buff, 1023)) > 0)
	{
		len += ret;
		buff[ret] = 0;
		tmp = dup;
		dup = ft_strjoin(dup, buff);
		ft_strdel(&tmp);
	}
	*buf = ft_strdup(dup);
	ft_strdel(&dup);
	(*buf)[len - 1] = 0;
	return (len - 1);
}
