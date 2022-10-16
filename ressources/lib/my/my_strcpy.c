/*
** EPITECH PROJECT, 2022
** Script: my_strcpy
** File description:
** Email: matthieu1.martin@epitech.eu
** Made by: Matthieu MARTIN
** Pool October 2022
*/

char *my_strcpy( char *dest , char const *src )
{
    int i = 0;

    while ( src[i] != '\0' ) {
        dest[i] = src[i];
        i++;
    }
    dest[i] = '\0';
    return dest;
}
