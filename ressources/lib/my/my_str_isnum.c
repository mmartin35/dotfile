/*
** EPITECH PROJECT, 2022
** Script: my_str_isnum
** File description:
** Email: matthieu1.martin@epitech.eu
** Made by: Matthieu MARTIN
** Pool October 2022
*/

int my_str_isnum(char const *str)
{
    int i = 0;

    while ( str[i] != '\0' ) {
        if (str[i] >= '0' && str[i] <= '9') {
            return 1;
        } else {
            return 0;
        }
    }
}
