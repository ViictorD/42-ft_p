/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_tabstr.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: vdarmaya <vdarmaya@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/05/14 15:55:58 by vdarmaya          #+#    #+#             */
/*   Updated: 2019/05/14 15:56:08 by vdarmaya         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "string.h"

char	**ft_tabstr(char **tab, char *entry)
{
	while (*tab)
	{
		if (!ft_strncmp(*tab, entry, ft_strlen(entry)))
			return (tab);
		tab++;
	}
	return (NULL);
}
