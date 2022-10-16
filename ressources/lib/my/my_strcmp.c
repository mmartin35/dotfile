/*
** EPITECH PROJECT, 2022
** Script: my_strcmp
** File description:
** Email: matthieu1.martin@epitech.eu
** Made by: Matthieu MARTIN
** Pool October 2022
*/

int my_strcmp(char const *s1, char const *s2)
{
    int i = 0;

    while ((s1[i] == s2[i]) && (s1[i] && s2[i])) {
        i++;
    }
    if ((s1[i] == '\0') && (s2[i] == '\0')) {
        return (0);
    } else {
        return (s1[i] - s2[i]);
    }
}

int find(char** tab, int size, char* search)
{
    int i = 0;

    while (i < size) {
        if (my_strcmp(tab[i], search) == 0) {
            return (i);
        }
        i++;
    }
    return (0);
}
