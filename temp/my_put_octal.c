/*
** EPITECH PROJECT, 2022
** Title: my_put_octal.c
** File description:
** <------------------------------------------->
** Made by         : matthieu1.martin@epitech.eu
** Creation date   : 02/11/2022 at 10:31:55
*/
#include <stdarg.h>
#include "include/my.h"
#include "include/my_printf.h"

void my_put_octal(va_list list)
{
    int length = 0;
    int i = 1;
    int x = va_arg(list, int);
    int power = 1;
    int num = x;

    if (x != 0) {
        while (num != 0) {
            num = num / 8;
            length++;
        }
        for (i ; i < length - 1; i++)
            power = (power * 8);
        for (i ; i < length; i++) {
            int digit = (x / power);
            my_put_nbr(digit);
            x = (x - (digit * power));
            power = (power / 8);
        }
    } else {
        my_putchar('0');
        return 1;
    }
}
