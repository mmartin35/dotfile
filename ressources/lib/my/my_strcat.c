/*
** EPITECH PROJECT, 2022
** Script: my_strcat
** File description:
** Email: matthieu1.martin@epitech.eu
** Made by: Matthieu MARTIN
** Pool October 2022
*/
#include "my.h"

char *my_strcat(char *dest, char const *src)
{
    int length = my_strlen(dest);
    int i = 0;

    while (src[i]) {
        dest[length + i] = src[i++];
    }
    dest[length + i] = '\0';
    return (dest);
}
