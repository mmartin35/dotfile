/*
** EPITECH PROJECT, 2022
** Script: my_strncat
** File description:
** Email: matthieu1.martin@epitech.eu
** Made by: Matthieu MARTIN
** Pool October 2022
*/
#include "my.h"

char *my_strncat(char *dest, char const *src, int nb)
{
    int length = my_strlen(dest);
    int i = 0;

    while (i < nb && src[i]) {
        dest[length + i] = src[i];
        i++;
    }
    dest[length + i] = '\0';
    return (dest);
}
