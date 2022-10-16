/*
** EPITECH PROJECT, 2021
** Script: my_swap
** File description:
** Email: matthieu0.martin@epitech.eu
** Made by: Matthieu MARTIN
** Pool October 2021
*/

void my_swap (int *a, int *b)
{
    int c = *b;

    *b = *a;
    *a = c;
}
