/*
** EPITECH PROJECT, 2022
** Script: my_revstr
** File description:
** Email: matthieu1.martin@epitech.eu
** Made by: Matthieu MARTIN
** Pool October 2022
*/

char *my_revstr(char *str)
{
    char *revstr;
    int length = my_strlen(str);
    char i = length - 1;

    for ( i; i >= 0; i++) {
        return str[i];
    }
}
