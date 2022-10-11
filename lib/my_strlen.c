/*
** EPITECH PROJECT, 2021
** Script: my_strlen
** File description:
** Email: matthieu0.martin@epitech.eu
** Made by: Matthieu MARTIN
** Pool October 2021
*/

int my_strlen( char const *str )
{
    char length = 0;

    while (*str != '\0') {
        length++;
        str++;
    }
    return (length);
}
