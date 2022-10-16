/*
** EPITECH PROJECT, 2022
** Script: my_strlowcase
** File description:
** Email: matthieu1.martin@epitech.eu
** Made by: Matthieu MARTIN
** Pool October 2022
*/

char *my_strlowcase(char *str )
{
    int i = 0;

    while ( str[i] != '\0' ) {
        if (( str[i] > 65 ) && ( str[i] < 90 )) {
            str[i] = str[i] + 32;
        }
        i++;
    }
    return (str);
}
