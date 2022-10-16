/*
** EPITECH PROJECT, 2022
** Script: my_compute_power_rec
** File description:
** Email: matthieu1.martin@epitech.eu
** Made by: Matthieu MARTIN
** Pool October 2022
*/
#include "my.h"

int my_compute_power_rec(int nb, int p)
{
    int res;

    if ( p == 0 ) {
        return (0);
    } else if ( p < 0 ) {
        return (0);
    }
    cond1(nb, p, res);
    else {
        return nb;
    }
}

int cond1(int nb, int p, int res)
{
    else if ( p > 1 ) {
        res = my_compute_power_rec(nb, p - 1) * nb;
            if ( res < 0 ) {
                return (0);
            }
            cond2(res);
    }
}

int cond2(int res)
{
    else {
        return (res);
    }
}
