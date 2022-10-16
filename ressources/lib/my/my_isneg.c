/*
** EPITECH PROJECT, 2021
** Script: my_isneg
** File description:
** Email: matthieu0.martin@epitech.eu
** Made by: Matthieu MARTIN
** Pool October 2021
*/
#include "my.h"

int my_isneg(int n)
{
    if (n < 0){
        my_putchar('N');
    } else {
        my_putchar('P');
    }
}
