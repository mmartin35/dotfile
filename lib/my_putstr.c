/*
** EPITECH PROJECT, 2021
** Script: my_putstr
** File description:
** Email: matthieu0.martin@epitech.eu
** Made by: Matthieu MARTIN
** Pool October 2021
*/

int my_putstr ( char const *str )
{
    for ( int i = 0; str[i] != '\0'; i++) {
        my_putchar(str[i]);
    }
}
