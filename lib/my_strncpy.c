/*
** EPITECH PROJECT, 2022
** Script: my_strncpy
** File description:
** Email: matthieu1.martin@epitech.eu
** Made by: Matthieu MARTIN
** Pool October 2022
*/

char *my_strncpy( char *dest, char const *src ,int n )
{
    int i = 0;

    while ( i != '\0') {
        dest[i] = src[i];
        i++;
    }
    return dest;
}
