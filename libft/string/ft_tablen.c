/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_tablen.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: vdarmaya <vdarmaya@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/05/14 15:53:32 by vdarmaya          #+#    #+#             */
/*   Updated: 2019/05/14 15:53:42 by vdarmaya         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "string.h"

size_t	ft_tablen(char **tab)
{
	size_t	size;
	size_t	index;

	size = 0;
	index = 0;
	while (tab[index])
	{
		if (*tab[index])
			size++;
		index++;
	}
	return (size);
}
