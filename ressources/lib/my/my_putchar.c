/*
** EPITECH PROJECT, 2021
** Script: my_putchar
** File description:
** Email: matthieu0.martin@epitech.eu
** Made by: Matthieu MARTIN
** Pool October 2022
*/
#include <unistd.h>

void my_putchar(int c)
{
    write (1, &c, 1);
}
